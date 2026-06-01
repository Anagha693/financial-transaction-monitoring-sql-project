USE financial_transaction_monitoring;
-- total transaction volume analysis
SELECT account_no, COUNT(*) AS total_transactions FROM transactions GROUP BY account_no ORDER BY total_transactions DESC;

-- Deposit vs Withdrawal Analysis
SELECT account_no,
  SUM(deposit_amt) AS total_deposit,
  SUM(withdrawal_amt) AS total_withdrawal
FROM transactions GROUP BY account_no;

-- Transaction category analysis
SELECT transaction_category,
  COUNT(*) AS total_transactions FROM transactions 
  GROUP BY transaction_category ORDER BY total_transactions DESC;
  
-- monthly transaction trend

SELECT transaction_year,
      transaction_month,
      SUM(deposit_amt) AS deposits,
      SUM(withdrawal_amt) AS withdrawals
FROM transactions
     GROUP BY transaction_year, transaction_month
     ORDER BY transaction_year, transaction_month;
     
-- Suspicious transaction analysis
-- High value transactions
SELECT * FROM transactions
   WHERE deposit_amt > 10000000 OR 
   withdrawal_amt > 10000000;
   
 -- Repeated transactions
 
 SELECT account_no,
     transaction_date,
     deposit_amt,
     withdrawal_amt,
     COUNT(*) AS repeat_count
FROM transactions
     GROUP BY account_no,
     transaction_date,
     withdrawal_amt,
     deposit_amt
HAVING COUNT(*) > 1
ORDER BY repeat_count DESC ;
 
 
SELECT t1.account_no AS sender,
       t2.account_no AS reciever,
       t1.transaction_date,
       t1.withdrawal_amt
FROM transactions t1 JOIN transactions t2
ON t1.transaction_date = t2.transaction_date AND
   t1.withdrawal_amt = t2.deposit_amt AND
   t1.account_no <> t2.account_no
   WHERE t1.withdrawal_amt > 1000000;
   
-- Top 5 largest withdrawal per account
WITH ranked_transactions AS( SELECT 
    account_no, transaction_date, withdrawal_amt,
     RANK() OVER( PARTITION BY account_no 
       ORDER BY withdrawal_amt DESC)
       AS withdrawal_rank 
       FROM transactions )
     

SELECT * FROM ranked_transactions
    WHERE withdrawal_rank <= 5;
    
    
-- Running transaction flow
 SELECT account_no,
        transaction_date,
        withdrawal_amt,
        deposit_amt,
        SUM(deposit_amt - withdrawal_amt) OVER (
            PARTITION BY account_no
            ORDER BY transaction_date) AS
            running_net_flow FROM transactions;
            
            
-- Detect sudden transaction spikes
SELECT account_no,
	   transaction_date,
       withdrawal_amt,
       LAG(withdrawal_amt)
       OVER( PARTITION BY account_no
           ORDER BY transaction_date) AS
           previous_transaction FROM transactions;
            
-- Fraud pattern analysis section
-- Frequent high value transaction
SELECT account_no,
       COUNT(*) AS high_value_count
       FROM transactions
       WHERE withdrawal_amt >= -10000000 OR 
       deposit_amt >= 10000000 
GROUP BY account_no ORDER BY high_value_count DESC;

-- Repeated Fixed Amount Transfers
SELECT withdrawal_amt,
       COUNT(*) AS frequency
FROM transactions
WHERE withdrawal_amt > 0
GROUP BY withdrawal_amt
ORDER BY frequency DESC; 

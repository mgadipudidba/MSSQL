with CTE (BRANCH_IDENTIFIER,bank_id,date_of_last_payment,Current_Balance) AS
(
SELECT BRANCH_IDENTIFIER,bank_id,convert(datetime, date_of_last_payment  ,103) as date_of_last_payment,Current_Balance from(
SELECT BRANCH_IDENTIFIER,Bank_id,(substring(date_of_last_payment,1,2)+'-'+substring(date_of_last_payment,3,2)+'-'+substring(date_of_last_payment,5,4) ) as date_of_last_payment,Current_Balance FROM dbo.Account_source
)x
)
delete from CTE where date_of_last_payment <='2014-02-28' and current_balance <=0
go
delete from address_source where bank_id not in(select parent_id from account_source)
go
delete from member_source where bank_id not in(select parent_id from account_source)
go
delete from account_source where parent_id not in(select bank_id from address_source)
go
delete from account_source where parent_id not in(select bank_id from member_source)
go
delete from member_source where bank_id not in(select parent_id from address_source)
go
delete from address_source where bank_id not in(select bank_id from member_source)
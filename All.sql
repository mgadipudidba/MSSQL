DECLARE @NAME VARCHAR(50)
drop table #tab					
create table #tab (loan_no varchar(50),branch_name varchar(50),branch_code  varchar(50),disb_date DATETIME,last_repaid_date DATETIME,od_prn varchar(50), DB_Name varchar(50))
   DECLARE  credit_bureau_approved_loans CURSOR FOR  SELECT NAME FROM MASTER.DBO.SYSDATABASES WHERE  
                         NAME NOT IN ('master','model','msdb','tempdb') and name like 'SPNDO%' order by name
        OPEN credit_bureau_approved_loans
              FETCH NEXT FROM credit_bureau_approved_loans INTO @NAME
                WHILE @@FETCH_STATUS=0
                   BEGIN 
              DECLARE @sql nvarchar(4000)
SELECT @sql =                 
	'insert into #tab
select loan_no, branch_name,branch_code,disb_date,last_repaid_date,od_prn,'''+@name+''' from  '+@name+'.dbo. summary   with(nolock) where loan_no in 
(''TNGL16440002930'',
''TNGL14000000105'',
''TNGL14000001541'',
''74034030007880'',
''TNGL11950001439'',
''TNGL11950001440'',
''TNGL09110000147'',
''TNGL15390002406'',
''TNGL07770004618'',
''TNGL07770004318'',
''TNGL07400003417'',
''TNGL11980003614'',
''Tngl09650001856'',
''Tngl09650003039'',
''Tngl01640003426'',
''Tngl01640003428'',
''Tngl09650002793'',
''Tngl15500004122'',
''Tngl15500004123'',
''Tngl01640003495'',
''Tngl07740002740'',
''Tngl17920001011'',
''927108030007154'')
'						EXEC sp_executesql @sql
                       FETCH NEXT FROM credit_bureau_approved_loans INTO @NAME
		 
                   END
select * from #tab
CLOSE credit_bureau_approved_loans
DEALLOCATE credit_bureau_approved_loans
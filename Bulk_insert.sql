
 
DECLARE @NAME VARCHAR(50)
--drop table #tab					
--create table #tab (loan_no varchar(50), DB_Name varchar(50))
   DECLARE  credit_bureau_approved_loans CURSOR FOR  SELECT NAME FROM MASTER.DBO.SYSDATABASES WHERE  
                         NAME NOT IN ('master','model','msdb','tempdb','IDR0003','TEST_SPNDOMSR0002_Daily3','AKL0002','BLR','BLR_Test','FORTNIGHT_TEST','MSR_Test','TEST_SPNDOGUL0002','WEEKLY_TEST','KMM0002','TEST_SPNDONDY0001') 
                         and name like 'SP%'  order by name
        OPEN credit_bureau_approved_loans
              FETCH NEXT FROM credit_bureau_approved_loans INTO @NAME
                WHILE @@FETCH_STATUS=0
                   BEGIN 
              DECLARE @sql nvarchar(4000)
SELECT @sql =  
'
INSERT INTO [DO-PRODUCTION\SPNDOAP0001].Final.dbo.Account_source
SELECT * FROM  '+@name+'.dbo.Account_source

INSERT INTO [DO-PRODUCTION\SPNDOAP0001].Final.dbo.Address_source
SELECT * FROM  '+@name+'.dbo.Address_source

INSERT INTO [DO-PRODUCTION\SPNDOAP0001].Final.dbo.Member_source
SELECT * FROM  '+@name+'.dbo.Member_source

INSERT INTO [DO-PRODUCTION\SPNDOAP0001].Final.dbo.Branch_Centre_Format
SELECT * FROM  '+@name+'.dbo.Branch_Centre_Format'

               
--	'insert into #tab
--select loan_no,'''+@name+''' from  '+@name+'.dbo. summary where loan_no=''52410604001511'''
						EXEC sp_executesql @sql
                       FETCH NEXT FROM credit_bureau_approved_loans INTO @NAME
                   END
--select * from #tab
CLOSE credit_bureau_approved_loans
DEALLOCATE credit_bureau_approved_loans
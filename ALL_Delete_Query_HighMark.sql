DECLARE @NAME VARCHAR(50)
   DECLARE  credit_bureau_approved_loans CURSOR FOR  SELECT NAME FROM MASTER.DBO.SYSDATABASES WHERE  
                         NAME NOT IN ('master','model','msdb','tempdb') and name
                          like 'SP%' and name not in ('Final') order by name
        OPEN credit_bureau_approved_loans
              FETCH NEXT FROM credit_bureau_approved_loans INTO @NAME
                WHILE @@FETCH_STATUS=0
                   BEGIN 
              DECLARE @sql nvarchar(4000)
SELECT @sql =  
'
truncate table  '+@name+'.dbo.account_source
truncate table  '+@name+'.dbo.address_source
truncate table  '+@name+'.dbo.member_source
truncate table  '+@name+'.dbo.Branch_Centre_Format
truncate table  '+@name+'.dbo.Highmark_Generated_Branch_List
truncate table '+@name+'.dbo.Highmark_Second_Submission_Loans'

               
--	'insert into #tab
--select loan_no,'''+@name+''' from  '+@name+'.dbo. summary where loan_no=''52410604001511'''
						EXEC sp_executesql @sql
                       FETCH NEXT FROM credit_bureau_approved_loans INTO @NAME
                   END
CLOSE credit_bureau_approved_loans
DEALLOCATE credit_bureau_approved_loans

/****** Object:  Index [IX_Cust_infoBC]    Script Date: 06/20/2014 20:41:12 ******/
CREATE CLUSTERED INDEX [IX_Cust_infoBC] ON [dbo].[Cust_info] 
(
	[branch_code] ASC,
	[disb_date] ASC,
	[loan_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 30) ON [PRIMARY]
GO

 
/****** Object:  Index [IX_NC_index_Cust_info]    Script Date: 06/20/2014 20:41:22 ******/
CREATE NONCLUSTERED INDEX [IX_NC_index_Cust_info] ON [dbo].[Cust_info] 
(
	[loan_no] ASC,
	[loan_cycle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 30) ON [PRIMARY]
GO

 

/****** Object:  Index [IX_NC_LC_index_Cust_info]    Script Date: 06/20/2014 20:41:30 ******/
CREATE NONCLUSTERED INDEX [IX_NC_LC_index_Cust_info] ON [dbo].[Cust_info] 
(
	[loan_cycle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 30) ON [PRIMARY]
GO


/****** Object:  Index [IX_Details_Loan]    Script Date: 06/20/2014 20:41:47 ******/
CREATE NONCLUSTERED INDEX [IX_Details_Loan] ON [dbo].[Details] 
(
	[Loan_no] ASC,
	[Trans_type] ASC
)
INCLUDE ( [Amount]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
 

/****** Object:  Index [IX_Details_Trans]    Script Date: 06/20/2014 20:41:58 ******/
CREATE CLUSTERED INDEX [IX_Details_Trans] ON [dbo].[Details] 
(
	[Trans_code] ASC,
	[Branch_code] ASC,
	[Trans_dt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
 
/****** Object:  Index [IX_index_Details]    Script Date: 06/20/2014 20:42:05 ******/
CREATE NONCLUSTERED INDEX [IX_index_Details] ON [dbo].[Details] 
(
	[Branch_code] ASC,
	[Trans_dt] ASC,
	[Trans_type] ASC,
	[Trans_code] ASC,
	[Loan_no] ASC,
	[Branch_name] ASC
)
INCLUDE ( [Amount]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO


 

/****** Object:  Index [Ind_schedule]    Script Date: 06/20/2014 20:42:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Ind_schedule] ON [dbo].[Schedule] 
(
	[Sch_date] ASC,
	[Loan_no] ASC,
	[Branch_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO

 
/****** Object:  Index [IX_Schedule_Branch_Code]    Script Date: 06/20/2014 20:42:35 ******/
CREATE NONCLUSTERED INDEX [IX_Schedule_Branch_Code] ON [dbo].[Schedule] 
(
	[Loan_no] ASC
)
INCLUDE ( [Sch_date],
[slno],
[Sch_prn_amt],
[Sch_int_amt],
[Total_Sch_amt],
[Bal_Prn],
[Bal_int],
[Branch_code]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 11) ON [PRIMARY]
GO

 

/****** Object:  Index [IDX1_index_Summary]    Script Date: 06/20/2014 20:42:49 ******/
CREATE NONCLUSTERED INDEX [IDX1_index_Summary] ON [dbo].[Summary] 
(
	[Loan_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO

 

/****** Object:  Index [IDX2_index_Summary]    Script Date: 06/20/2014 20:42:58 ******/
CREATE NONCLUSTERED INDEX [IDX2_index_Summary] ON [dbo].[Summary] 
(
	[Branch_name] ASC,
	[Loan_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO

 

/****** Object:  Index [IX_NC_index_Summary]    Script Date: 06/20/2014 20:43:06 ******/
CREATE NONCLUSTERED INDEX [IX_NC_index_Summary] ON [dbo].[Summary] 
(
	[loan_status] ASC,
	[Branch_name] ASC,
	[Preclose_status] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO

 

/****** Object:  Index [IX_NC_index_Summary_1]    Script Date: 06/20/2014 20:43:15 ******/
CREATE NONCLUSTERED INDEX [IX_NC_index_Summary_1] ON [dbo].[Summary] 
(
	[Loan_no] ASC,
	[centre_no] ASC,
	[grp_name] ASC,
	[co_name] ASC,
	[slum_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO

 

/****** Object:  Index [IX_SummaryBC]    Script Date: 06/20/2014 20:43:23 ******/
CREATE CLUSTERED INDEX [IX_SummaryBC] ON [dbo].[Summary] 
(
	[branch_code] ASC,
	[Preclose_date] ASC,
	[Loan_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO

 

/****** Object:  Index [IX_SummaryCO]    Script Date: 06/20/2014 20:43:32 ******/
CREATE NONCLUSTERED INDEX [IX_SummaryCO] ON [dbo].[Summary] 
(
	[co_name] ASC,
	[grp_name] ASC,
	[centre_no] ASC,
	[slum_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
 

/****** Object:  Index [IX_SummaryLrd]    Script Date: 06/20/2014 20:43:44 ******/
CREATE NONCLUSTERED INDEX [IX_SummaryLrd] ON [dbo].[Summary] 
(
	[last_repaid_date] ASC,
	[os_Prn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO

sp_updatestats
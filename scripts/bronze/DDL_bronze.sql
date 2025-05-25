/*
create  bronze layer tables 

*/

create or alter procedure bronze.load_bronze as 
begin 
   Declare @start_time Datetime, @end_time Datetime;

begin try 
print'================================';
print'Loading Bronze Layer';
print'================================';
print'--------------------------------';
print 'Loading CRM Tables ';
print'--------------------------------';
 set @start_time= GETDATE();
	TRUNCATE TABLE BRONZE.crm_cust_info;
	BULK INSERT BRONZE.crm_cust_info
	FROM 'C:\Users\Deena\Desktop\sql\datasets\source_crm\cust_info.csv' 
	WITH(
	  FIRSTROW =2,
	  FIELDTERMINATOR= ',',
	  TABLOCK --- LOKIN TO INTAIER TABLE 

	);
	 set @end_time= GETDATE();
	 print '>>> Load Duration : ' + cast( Datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
	 print '>>-------------------';
	--- TEST THE TABLE 
	---SELECT * FROM BRONZE.crm_cust_info;
	--SELECT COUNT(*) FROM BRONZE.crm_cust_info;
	 set @start_time= GETDATE();
	TRUNCATE TABLE BRONZE.crm_prd_info;

	BULK INSERT BRONZE.crm_prd_info
	FROM 'C:\Users\Deena\Desktop\sql\datasets\source_crm\prd_info.csv' 
	WITH(
	  FIRSTROW =2,
	  FIELDTERMINATOR= ',',
	  TABLOCK --- LOKIN TO INTAIER TABLE 

	);
	 set @end_time= GETDATE();
	 print '>>> Load Duration : ' + cast( Datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
	 print '>>-------------------';

	  set @start_time= GETDATE();
	TRUNCATE TABLE BRONZE.crm_sales_details;
	BULK INSERT BRONZE.crm_sales_details
	FROM 'C:\Users\Deena\Desktop\sql\datasets\source_crm\sales_details.csv' 
	WITH(
	  FIRSTROW =2,
	  FIELDTERMINATOR= ',',
	  TABLOCK --- LOKIN TO INTAIER TABLE 

	);
	 set @end_time= GETDATE();
	 print '>>> Load Duration : ' + cast( Datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
	 print '>>-------------------';


	----insert ERP data --------
	 set @start_time= GETDATE();
print'--------------------------------';
print 'Loading ERP Tables ';
print'--------------------------------';
	TRUNCATE TABLE BRONZE.erp_CUST_AZ12;
	BULK INSERT BRONZE.erp_CUST_AZ12
	FROM 'C:\Users\Deena\Desktop\sql\datasets\source_erp\CUST_AZ12.csv' 
	WITH(
	  FIRSTROW =2,
	  FIELDTERMINATOR= ',',
	  TABLOCK --- LOKIN TO INTAIER TABLE 

	);
	 set @end_time= GETDATE();
	 print '>>> Load Duration : ' + cast( Datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
	 print '>>-------------------';
 
  set @start_time= GETDATE();
	TRUNCATE TABLE BRONZE.erp_LOC_A101;
	BULK INSERT BRONZE.erp_LOC_A101
	FROM 'C:\Users\Deena\Desktop\sql\datasets\source_erp\LOC_A101.csv' 
	WITH(
	  FIRSTROW =2,
	  FIELDTERMINATOR= ',',
	  TABLOCK --- LOKIN TO INTAIER TABLE 

	);
	 set @end_time= GETDATE();
	 print '>>> Load Duration : ' + cast( Datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
	 print '>>-------------------';

	  set @start_time= GETDATE();
	TRUNCATE TABLE BRONZE.erp_PX_CAT_G1V2;
	BULK INSERT BRONZE.erp_PX_CAT_G1V2
	FROM 'C:\Users\Deena\Desktop\sql\datasets\source_erp\PX_CAT_G1V2.csv' 
	WITH(
	  FIRSTROW =2,
	  FIELDTERMINATOR= ',',
	  TABLOCK --- LOKIN TO INTAIER TABLE 

	);
	 set @end_time= GETDATE();
	 print '>>> Load Duration : ' + cast( Datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
	 print '>>-------------------';
	end try
	begin catch 
	  print'============================'
	  print'Error Occured During Loading Bronze Layer'
	  print 'Error Messagr'+  Error_message();
	  print 'Error Messagr'+ cast  (Error_number() as nvarchar);
	   print 'Error Messagr'+ cast  (Error_state() as nvarchar);
	  print'============================'
	end catch
end


exec bronze.load_bronze

----customer infromation table 
IF OBJECT_ID('sliver.crm_cust_info','U') IS NOT NULL
 DROP TABLE sliver.crm_cust_info;
create table sliver.crm_cust_info(
 cst_id int,
 cst_key nvarchar(50),
 cst_fristname nvarchar(50),
  cst_lastname nvarchar(50),
   cst_material_status nvarchar(50),
    cst_fgndr nvarchar(50),
	cst_create_date date,
	dwh_create_date datetime2 default getdate()

);

----Product table 
IF OBJECT_ID('sliver.crm_prd_info','U') IS NOT NULL
 DROP TABLE sliver.crm_prd_info;
create table sliver.crm_prd_info(
 prd_id int,
 cat_id nvarchar(50),
 prd_key nvarchar(50),
 prd_nm nvarchar(50),
 prd_cost int,
 prd_lin nvarchar(50),
 prd_start_dt date,
 prd_end_dt date
,dwh_create_date datetime2 default getdate()
);

---- sales Details table
IF OBJECT_ID('sliver.crm_sales_details','U') IS NOT NULL
 DROP TABLE sliver.crm_sales_details;
create table sliver.crm_sales_details(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id int,
sls_order_dt date,
sls_ship_dt date,
sls_due_dt date,
sls_sales int,
sls_quantity int,
sls_price int,
dwh_create_date datetime2 default getdate()
);


----------------------ERP Tables---------------------------

IF OBJECT_ID('sliver.erp_CUST_AZ12','U') IS NOT NULL
 DROP TABLE sliver.erp_CUST_AZ12;
create table sliver.erp_CUST_AZ12(
CID nvarchar(50),
BDATE DATE,
GEN nvarchar(50)
,dwh_create_date datetime2 default getdate()
);
----------
IF OBJECT_ID('sliver.erp_PX_CAT_G1V2','U') IS NOT NULL
 DROP TABLE sliver.erp_PX_CAT_G1V2;
create table sliver.erp_PX_CAT_G1V2(
ID nvarchar(50),
CAT nvarchar(50),
SUBCAT nvarchar(50),
MAINTENANCE nvarchar(50),
dwh_create_date datetime2 default getdate()
);
--------
IF OBJECT_ID('sliver.erp_LOC_A101','U') IS NOT NULL
 DROP TABLE sliver.erp_LOC_A101;
create table sliver.erp_LOC_A101(
CID nvarchar(50),
CNTRY nvarchar(50),
dwh_create_date datetime2 default getdate()
);
------------


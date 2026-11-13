/*
==========================================================================================================================
DDL Script:- Create Bronze layer table.
Script Purpose:
         This script creates tables in the 'bronze' schema, dropping any existing tables first if they’re already there.
         Run it to redesign the DDL structure of the bronze tables.
==========================================================================================================================
*/
IF OBJECT_ID('bronze.crm_cust_info' , 'U') IS NOT NULL
DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
	cst_id INT,
	cst_key NVARCHAR(70),
	cst_firstname NVARCHAR(70),
	cst_lastname NVARCHAR(70),
	cst_marital_status NVARCHAR(70),
	cst_gndr NVARCHAR(70),
	cst_create_date DATE
);

IF OBJECT_ID('bronze.crm_prd_info' , 'U') IS NOT NULL
DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info(
	prd_id INT,
	prd_key NVARCHAR(70),
	prd_nm NVARCHAR(70),
	prd_cost NVARCHAR(70),
	prd_line NVARCHAR(70),
	prd_start_dt DATE,
	prd_end_dt DATE
);

IF OBJECT_ID('bronze.crm_sales_details' , 'U') IS NOT NULL
DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details(
	sls_ord_num NVARCHAR(70),
	sls_prd_key NVARCHAR(70),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

IF OBJECT_ID('bronze.erp_cust_az12' , 'U') IS NOT NULL
DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12(
	cid NVARCHAR(70),
	bdate DATE,
	gen NVARCHAR(70)
);

IF OBJECT_ID('bronze.erp_loc_a101' , 'U') IS NOT NULL
DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101(
	cid NVARCHAR(70),
	cntry NVARCHAR(70)
);

IF OBJECT_ID('bronze.erp_px_cat_g1v2' , 'U') IS NOT NULL
DROP TABLE bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2(
id NVARCHAR(70),
cat NVARCHAR(70),
subcat NVARCHAR(70),
maintenance NVARCHAR(70)
);

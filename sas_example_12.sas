/* CODY, R. and R. Pass SAS programming by example */
/* chapter 12: creating simple charts */

/* calculate create date for inclusion in footnote */
%let date = %sysfunc(today(), date11.);

/* get the clinical dataset */
LIBNAME sasexmpl "/folders/myfolders/sasuser.v94/sasexmpl/";

proc print data=sasexmpl.clinical;
	title "Clinical data";
	footnote "Prepared by Andy Harrison [(c) &date.]";	/* add today's date into footnote */
	format Date DATE9.;
	where routine = 'N';
run;

data sales;
	set sasexmpl.sales;
	format price dollar6.2;
	income = price * quantity;
	format income dollar9.2;
run;
	
proc print data=sales noobs;
	title "Sales data";
	sum income;
run;
options pagesize=20;
/* Create a simple vertical bar chart for sales data */
proc chart data=sales;
	title "Vertical bar chart (sales data)";
	vbar region;					/* indicate the variable for which frequency counts are required */
run;

options pagesize=max;
/* Create a simple horizontal bar chart for sales data */
proc chart data=sales;
	title "Horizontal bar chart (sales data)";
	hbar region;					/* only need to change vbar into hbar */
run;

options linesize=64;
/* Create a simple horizontal bar chart for sales data */
proc chart data=sales;
	title "Horizontal bar chart (sales data|no statistics)";
	hbar region / nostats;					/* don't display statistics */
run;

options pagesize=20 linesize=96;
/* Create a simple vertical bar chart for sales data */
proc chart data=sales;
	title "Vertical bar chart (sales data|percentages)";
	vbar region / type=percent;					/* bar height is percentage of cumulative total */
run;

/* Bar chart for a continuous variable (system chosen mid-points) */
proc chart data=sales;
	title "Vertical bar chart continuous variable (sales|sys mid-point)";
	vbar price;
run;

/* Bar chart for a continuous variable (user defined mid-points) */
proc chart data=sales;
	title "Vertical bar chart continuous variable (sales|user mid-point)";
	vbar price / midpoints=8 to 20 by 2;	/* define the mid-points to be used when plotting frequency */
run;

options pagesize=30;
proc chart data=sales;
	title "Horizontal bar chart continuous variable (sales|discrete)";
	hbar price / discrete nostat;	/* treat the values as discrete categories */
									/* only plots bars where frequency > 0 */
run;


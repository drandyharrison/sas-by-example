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

/* plotting the sum of variables */
proc chart data=sales;
	title "Sum of quantity by region";
	hbar region / sumvar=quantity type=sum;
run;

/* plotting two nested categories */
proc chart data=sales;
	title "Nested categories | GROUP= option";
	hbar item / group=region nostats;
run;

/* displaying groups within a bar (character) */
proc chart data=sales;
	title "Groups within a bar | SUBGROUP= option character";
	vbar region / subgroup=item;
run;

/* displaying groups within a bar (numeric) */
proc chart data=sales;
	title "Groups within a bar | SUBGROUP= option numeric";
	vbar region / subgroup=price;
run;

/* Creating 3-D block charts */
data blockeg;
	set sasexmpl.clinical (keep=Date Routine SBP dbp druggrp);
	Year = Year(Date);						/* create Year variable */
run;

options pagesize=50;
proc chart data=blockeg;
	title "Example of a block chart";
	block year / group=routine discrete;						/*	place YEAR on the x-axis, 
																	ROUTINE on the depth axis and 
																	the number of visits for the given YEAR and
																	ROUTINE on the vertical axis.
																	The DISCRETE option is necessary to have 
																	the actual YEAR values on the x-axis */
	block year / group=routine sumvar=sbp type=mean discrete;	/*	the SUMVAR= option and TYPE=MEAN gives the
																	mean value for each YEAR and ROUTINE value. */
	format sbp 5.;												/*	prevents long decimal values in the boxes */
run;

/* problem 12-7 */
proc chart data=sasexmpl.clinical;
	title "Problem 12-7";
	vbar chol / group=druggrp subgroup=routine midpoints=200 to 400 by 40;
run;

/* problem 12-8 */
proc chart data=blockeg;
	title "Problem 12-8";
	block druggrp /group=routine sumvar=dbp type=mean discrete;
	format dbp 5.;
run;
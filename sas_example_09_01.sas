/* CODY, R. and R. Pass SAS programming by example */
/* creating a simple report */
/* CCTV camera locations Published by Durham County Council (data.gov.uk). */
/* Licensed under  [Open Government Licence] Open Government Licence. */
filename cctv "/folders/myfolders/sasuser.v94/sas-by-example/CCTV_cameras.csv";

data cctv_loc;
	infile cctv dlm="," dsd obs=2;		/* only read the first 2 observations to check */
	length loc $120;
	input loc $ name $ east north;
run;

/* read the full data set */
data cctv_loc;
	infile cctv dlm="," dsd;			/* dsd option is necessary as there may be commas in location string */
	length loc $120;
	input loc $ name $ east north;
	label loc="Location" name="CCTV ID";
run;

/* only report the first 10 observations */
proc print data=cctv_loc (obs=10);
	title "CCTV locations in County Durham - first 10 records";
run;

data mob_cctv (drop=loc);
	set cctv_loc;
	if "mobile" = lowcase(loc);		/* subsetting if */
run;

/* only report the mobile CCTV locations */
proc print data=mob_cctv noobs;
	id name;													/* make name the observation ID */
	title "CCTV locations in County Durham - mobile cameras";
run;

/* examples from the book */
LIBNAME sasexmpl "/folders/myfolders/sasuser.v94/sasexmpl/";

/* sort data ready for calculating sub-totals */
proc sort data=sasexmpl.medical out=medical;
	by diagcode;
run;

/* calculate create date for inclusion in footnote */
%let date = %sysfunc(today(), date11.);

proc print data=medical label;
	id sub_id;
	var hospcode admit_dt disch_dt los cost;			/* controls order variables appear in report */
	by diagcode;										/* sub-totals for each value of diagnostic code */
	sum los cost;										/* sum the los and cost variables */
	title "Medical database report";
	title2 "------------------------------------";
	footnote "Prepared by Andy Harrison [(c) &date.]";	/* add today's date into footnote */
	label	diagcode = "Diagnostic code"
			admit_dt = "Admission date"
			disch_dt = "Discharge date"
			hospcode = "Hospital code"
			los      = "Length of stay"
			cost     = "Cost of treatment";
	format	cost dollar10.2
			sub_id ssn11.
			admit_dt disch_dt date9.;
run;

data donor;
	input	f_name $		/* forename */
			l_name $		/* surname */
			amount COMMA4.	/* donation amount */
			date DDMMYY8.;	/* donation date */
	label	f_name = "Forename" 
			l_name = "Surname"
			amount = "Amount"
			date = "Donation date";
	format	amount dollar7.2
			date DATE11.;
	l_name = UPCASE(l_name);
datalines;
Janet Bloom $50 14/01/94
Dora Chelsea $35 14/06/94
Walter Donnelly $35 07/01/95
Walter Donnelly $10 06/07/94
Anne Farnham $100 07/07/93
James Zoll $45 06/07/94
;

title "Donation data";
title2 "----------------------";
footnote;

proc print data=donor noobs label;
	var l_name f_name date amount;
	sum amount;
run;
	
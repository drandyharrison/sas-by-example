/* CODY, R. and R. Pass SAS programming by example */
/* reading instream data using modified list format and informat statement */
data informs1;
	informat lastname $20. DOB MMDDYY8. Gender $1.;
	input ID lastname DOB Height Weight Gender Age;
	/* format the date value */
	format DOB DATE9.;
	datalines;
	1 SMITH 1/23/66 68 144 M 26
	2 JONES 3/14/60 78 202 M 32
	3 DOE 11/26/47 62 99 F 45
	4 WASHINGTON 8/1/70 66 101 F 22
	;

proc print data=informs1 noobs;
	title "Example 1.3a";
	/* add a more meaningful label for the field DOB */
	label DOB="Date of Birth";
run;

/* reading instream data using modified list format */
data informs2;
	/* read raw dates in UK format */
	input ID lastname : $20. DOB : DDMMYY8. Height Weight Gender : $1. Age;
	format DOB DATE9.;
	datalines;
	1 SMITH 23/11/66 68 144 M 26
	2 JONES 14/3/60 78 202 M 32
	3 DOE 26/11/47 62 99 F 45
	4 WASHINGTON 1/8/70 66 101 F 22
	;

proc print data=informs2 noobs;
	title "Example 1.3b";
	label DOB="Date of Birth";
run;
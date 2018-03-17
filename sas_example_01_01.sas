/* CODY, R. and R. Pass SAS programming by example */
/* reading instream data - with missing values - using list format */
data listinp;
	input id height weight gender $ age;
	datalines;
	1 68 144 M 23
	2 . 202 M 34
	3 62 99 F 37
	4 61 101 F 45
	;

proc print data=listinp noobs;
	title 'Example 1';
run;
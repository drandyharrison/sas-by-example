/* CODY, R. and R. Pass SAS programming by example */
/* reading comma separated instream data using the DLM= option */
data commas;
	infile datalines dlm=",";
	input id height weight gender $ age;
	datalines;
	1,68,144,M,23
	2,78,202,M,34
	3,62, 99,F,37
	4,61,101,F,45
	;

proc print data=commas noobs;
	title 'Example 1.2a';
run;

/* reading comma separated instream data with missing values using the DSD option */
data commas2;
	infile datalines dsd;
	input x y text $;
	datalines;
	1,2,XYZ
	3,,STRING
	4,5,"TESTING"
	6,,"ABC,XYZ"
	;

proc print data=commas2;
	title "Example 1.2b";
run;
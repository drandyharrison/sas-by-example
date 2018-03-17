/* CODY, R. and R. Pass SAS programming by example */
/* reading data from external files */
data extern1;
	infile "/folders/myfolders/sasuser.v94/sas_by_example/hgtwgt.dat";	/* hard-code external data file */
	input id height weight gender $ age;
run;

proc print data=extern1 noobs;
	title "Example 1.13a";
run;

/* use a filename */
filename oscar "/folders/myfolders/sasuser.v94/sas_by_example/hgtwgt.dat";

data extern2;
	infile oscar;
	input id height weight gender $ age;
run;

proc print data=extern2 noobs;
	title "Example 1.13b";
run;
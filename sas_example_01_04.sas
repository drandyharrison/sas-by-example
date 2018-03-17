/* CODY, R. and R. Pass SAS programming by example */
/* read instream data with the & modifier to read strings which include spaces */
data ampers;
	input name & $25. age gender : $1.;
	datalines;
	RASPUTIN     45 M
	BESTY ROSS   62 F
	ROBERT LOUIS STEPHENSON  75 M
	;
	
proc print data=ampers;
	title "Example 1.4";
run;
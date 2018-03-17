/* CODY, R. and R. Pass SAS programming by example */
/* suppressing error messages */
data errors;
	input x 1-2
		  y 4-5;
datalines;			/* some invalid data to illustrate errors in the SAS log */
11 23
23 NA
NA 47
55 66
;

proc print data=errors noobs;
	title "Example 1.12a";
run;

/* use ?? to suppress all error reporting */
data hideerrs;
	input x ?? 1-2
		  y ?? 4-5;
datalines;			/* the same invalid data */
11 23
23 NA
NA 47
55 66
;

proc print data=hideerrs noobs;
	title "Example 1.12b";
run;

/* CODY, R. and R. Pass SAS programming by example */
/* reading a mixture of record types in one DATA step */
data mixed;
	input @20 type $1.@;	/* after reading, the trailing @ holds the line pointer */
	if type = '1' then		/* the if-then-else tests the value of type and processes the data accordingly */
		input ID	1-3
			  Age	4-5
			  Wgt	6-8;
	else if type = '2' then
		input ID	1-3
			  Age	10-11
			  Wgt	15-17;
datalines;
00134168           1
00245155           1
003      23   220  2
00467180           1
005      35   190  2
;

proc print data=mixed noobs;
	title "Example 1.10";
run;
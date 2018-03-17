/* CODY, R. and R. Pass SAS programming by example */
/* holding the data line through multiple iterations of the DATA step */
data longway;
	input x y;
datalines;
1 2
3 4
5 6
6 9
10 12
13 14
;

proc print data=longway;
	title "Example 1.11a - long way";
run;

data shortway;
	input x y @@;
datalines;
1 2 3 4 5 6
6 9 10 12 13 14
;

proc print data=shortway;
	title "Example 1.11b - short way";
run;
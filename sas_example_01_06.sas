/* CODY, R. and R. Pass SAS programming by example */
/* reading column data that requires informats */
data pointer;
	input	@1  id		 3.
			@5  gender	$1.
			@7  age		 2.
			@10 height	 2.
			@13 dob		 ddmmyy8.;
	format dob date9.;
datalines;
101 M 26 68 230166
102 M 32 78 140360
103 F 45 62 261147
104 F 22 65 010870
;

proc print data=pointer noobs;
	title "Example 1.6";
run;
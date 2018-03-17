/* CODY, R. and R. Pass SAS programming by example */
/* using informat lists and relative pointer controls */
data longway;
	input	ID		1-3
			Q1		4
			Q2		5
			Q3		6
			Q4		7
			Q5		8
			Q6		9-10
			Q7		11-12
			Q8		13-14
			Q9		15-16
			Q10		17-18
			Height	19-20
			Age		21-22;
datalines;
1011132410161415156823
1021433212121413167221
1032334214141212106628
1041553216161314126622
;

proc print data=longway noobs;
	title "Example 1.9a - long way";
run;

data shortway;
	input	   ID 1-3
			@4 (Q1-Q5) (1.)
			@9 (Q6-Q10 Height Age) (2.);
datalines;
1011132410161415156823
1021433212121413167221
1032334214141212106628
1041553216161314126622
;

proc print data=shortway noobs;
	title "Example 1.9b - short way";
run;

data paris;
	input @1   ID 3.					/* start at column 1 and read a 3-byte numeric field */
	      @6  (QN1 - QN5) ( 1. +3)		/* go to column 6 and repeat five times: read a 1-byte numeric field then advance 3 columns */
	      @7  (QC1 - QC5) ($1. +3)		/* go to column 7 and repeat five times: read a 1-byte character field then advance 3 columns */
	      @26 (Height Age) (2. +1 2.);	/* gp to column 26 and read a 2-byte field into the numeric variable Height, advance the column one column and read a 2-byte field into the variable Age */
datalines;
101  1A  3A  4B  4A  6A  68 26
102  1A  3B  2B  2A  2B  78 32
103  2B  3D  2C  4C  4B  62 45
104  1C  5C  2D  6A  6A  66 22
;

proc print data=paris noobs;
	title "Example 1.9c";
run;
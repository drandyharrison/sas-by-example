/* CODY, R. and R. Pass SAS programming by example */
/* chapter 13: plotting data */

/* calculate create date for inclusion in footnote */
%let date = %sysfunc(today(), date11.);

/* define footnote for all plots */
footnote "Prepared by Andy Harrison [(c) &date.]";

data clin_2;
	input	Name $
			Date MMDDYY8.
			DRUGGRP $
			CHOL
			SBP
			DBP
			HR
			ROUTINE $;
	format	Date DATE9.
			Chol SBP DBP HR comma5.1;
	label	Druggrp = "Drug group"
			Chol="Cholestrol"
			HR="Heart rate"
			Routine="Routine?"
			SBP="Systolic blood pressure"
			DBP="Diastolic blood pressure";
datalines;
George 01/05/89 D 400 160  90 88 Y
Fred 02/19/90 D 390 180 100 82 N
Ron 01/01/90 P 387 190 110 90 N
Ray 05/15/91 D 380 120  78 56 Y
Dave 01/06/90 P 399 188 110 92 N
Jennifer 01/01/92 D 387 128  62 60 N
Carol 01/05/90 P 376 118  68 54 Y
Steven 08/15/94 P 220 160  90 77 Y
John 08/17/94 D 170 128  62 64 N
Mary 11/25/94 P 188 128  64 72 Y
;

proc print data=clin_2 label noobs;
	title "Clinical (2) data";
run;

options pagesize=30;
/* simple scatter plot */
proc plot data=clin_2;
	title "Scatter plot of SBP by DBP";
	plot dbp *sbp;
run;

/* placing multiple plots on the same set of axes */
proc plot data=clin_2;
	title "Scatter plot of SBP by DBP and SBP by HR";
	plot (dbp hr) *sbp / overlay;
run;
/* the plot is not very helpful, as it's not possible to tell which plot is DBP and which is HR */
/* using different symbols for the two plots */
proc plot data=clin_2;
	title "Multiple plots on one set of axes";
	title2 "with different plotting symbols";
	plot DBP*SBP='D'			/* set the symbol for DBP by SBP as 'D' */
	     HR*SBP='H' / overlay;	/* set the symbol for HR by SBP as 'H' */
run;

/* use a third variable to indicate the plotting symbol */
proc plot data=clin_2;
	title "Scatter plot of SBP by DBP";
	title2 "with Drug Group as the plotting symbols";
	plot DBP*SBP=DRUGGRP;
run;

/* labelling individual points */
proc plot data=clin_2;
	title "Plot of systolic BP vs Heart rate";
	title2 "with name as the labelling variable";
	plot HR*SBP $ Name="*";
run;
/* CODY, R. and R. Pass SAS programming by example */
/* reading data more than once */
data parts;
	input	@1  partid		$14.
			@1  state		 $2.
			@6  weight		  3.
			@13 yr			  2.
			@16 partdesc	$24.
			@41 quantity	  4.;
	format quantity comma5.;
datalines;
NY101110060172 LEFT-HANDED WHISKER       233
MA102085112885 FULL-NOSE BLINK TRAP     1423
CA112216111291 DOUBLE TONE SAND BIT       45
NC222845071970 REVERSE SPIRAL RIPSHANK   876
;

proc print data=parts;
	title "Example 1.8";
run;
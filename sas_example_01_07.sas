/* CODY, R. and R. Pass SAS programming by example */
/* reading mutiple records per observation */
data pointer;
	input #1 @1  ID		 3.
			 @5  Gender	$1.
			 @7  Age	 2.
			 @10 Height	 2.
			 @13 DoB	 DDMMYY6.
		  #2 @5  SBP	 3.
		     @9  DBP	 3.
		     @13 HR		 3.;
	format DoB DATE9.;
datalines;
101 M 26 68 231266
101 120  80 68
102 M 32 78 140360
102 162  92 74
103 F 45 62 261147
103 134  86 74
104 F 22 66 010870
104 116  72 67
;

proc print data=pointer;
	title "Example 1.7a";
run;

/* skipping records */
data skipsome;
	input #2 @1  ID		 3.
			 @12 Sex	$6.
		  #4;
datalines;
101 256 RED   9870980
101 899245 FEMALE 7987644
101 BIG   9887987
101 CAT 397  BOAT 68
102 809 BLUE  7918787
102 732866 MALE   6856976
102 SMALL 3884987
102 DOG 111  CAR  14
;

proc print data=skipsome noobs;
	title "Example 1.7b";
run;
/* reading instream data in columns */
data colinp1;
	input id 1 height 2-3 weight 4-6 gender $ 7 age 8-9;
/* don't indent as the tab is read as the first field and the data are out of step */
datalines;
168144M23
278202M34
362 99F37
461101F45
	;
	
proc print data=colinp1 noobs;
	title "Example 1.5a";
run;

/* the same data step but a better layout */
data colinp2;
	input id 1 
		  height 2-3 
		  weight 4-6 
		  gender $ 7 
		  age 8-9;
datalines;
168144M23
278202M34
362 99F37
461101F45
	;
	
proc print data=colinp2 noobs;
	title "Example 1.5b";
run;

/* only reading some of the values in column input */
data colinp3;
	input id 1 
		  age 8-9;
datalines;
168144M23
278202M34
362 99F37
461101F45
	;
	
proc print data=colinp3 noobs;
	title "Example 1.5c";
run;

/* reading values in a different order */
data colinp4;
	input age 8-9
		  id 1 
		  weight 4-6 
		  height 2-3 
		  gender $ 7;
datalines;
168144M23
278202M34
362 99F37
461101F45
	;
	
proc print data=colinp4 noobs;
	title "Example 1.5d";
run;
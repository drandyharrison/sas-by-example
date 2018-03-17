/* CODY, R. and R. Pass SAS programming by example */)
/* creating a simple report */
/* CCTV camera locations Published by Durham County Council (data.gov.uk). */
/* Licensed under  [Open Government Licence] Open Government Licence. */
filename cctv "/folders/myfolders/sasuser.v94/sas_by_example/CCTV_cameras.csv";

data cctv_loc;
	infile cctv dlm="," dsd obs=2;		/* only read the first 2 observations to check */
	length loc $120;
	input loc $ name $ east north;
run;

/* read the full data set */
data cctv_loc;
	infile cctv dlm="," dsd;			/* dsd option is necessary as there may be commas in location string */
	length loc $120;
	input loc $ name $ east north;
	label loc="Location" name="CCTV ID";
run;

/* only report the first 10 observations */
proc print data=cctv_loc (obs=10);
	title "CCTV locations in County Durham - first 10 records";
run;

data mob_cctv (drop=loc);
	set cctv_loc;
	if "mobile" = lowcase(loc);		/* subsetting if */
run;

/* only report the mobile CCTV locations */
proc print data=mob_cctv noobs;
	id name;													/* make name the observation ID */
	title "CCTV locations in County Durham - mobile cameras";
run;

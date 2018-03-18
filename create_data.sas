/* CODY, R. and R. Pass SAS programming by example */
LIBNAME SASEXMPL "/folders/myfolders/sasuser.v94/sas_by_example"; 

/* Create the SAS data set CLINICAL */
DATA SASEXMPL.CLINICAL;
	LENGTH DRUGGRP ROUTINE $ 1;
	INFORMAT DATE MMDDYY8.;
	INPUT PATNUM DATE DRUGGRP CHOL SBP DBP HR ROUTINE;
	FORMAT DATE MMDDYY8.;
DATALINES;
01    01/05/89     D    400    160     90    88     Y
01    02/15/89     D    350    156     88    80     Y
01    05/18/90     D    350    140     82    76     Y
01    09/09/90     D    300    138     78    78     N
01    11/11/90     D    305    142     82    84     Y
01    01/05/91     D    270    142     80    72     N
01    02/18/91     D    260    156     92    88     N
02    02/19/90     D    390    180    100    82     N
02    02/22/90     D    320    178     88    86     Y
02    02/25/90     D    325    172     82    78     Y
02    04/24/90     D    304    166     78    99     N
02    08/25/90     D    299    150     80    80     Y
02    03/13/91     D    222    144     82    72     Y
02    07/16/91     D    243    140     80    68     Y
02    10/10/91     D    242    138     74    62     Y
02    10/30/91     D    230    156     92    88     N
02    12/25/91     D    200    142     82    80     Y
03    01/01/90     P    387    190    110    90     N
03    02/13/90     P    377    188     96    84     Y
03    05/09/90     P    380    182     88    80     Y
03    08/17/90     P    400    186     92    82     Y
03    10/10/90     P    390    182     90    78     N
03    10/11/90     P    380    178     82    72     Y
03    11/11/90     P    370    160     82    72     Y
03    02/02/91     P    380    156     78    70     Y
04    05/15/91     D    380    120     78    56     Y
04    08/20/91     D    370    122     76    58     N
04    03/23/92     D    355    128     68    60     Y
04    05/02/92     D    306    130     72    68     N
04    07/02/92     D    279    126     74    62     Y
04    07/03/92     D    277    126     74    64     Y
04    07/05/92     D    261    130     80    72     N
05    01/06/90     P    399    188    110    92     N
05    03/06/90     P    377    182    100    88     N
05    04/24/90     P    400    180     92    82     Y
05    06/24/90     P    388    176     88    80     Y
05    08/01/90     P    378    162     82    78     Y
05    10/10/90     P    388    156     78    78     Y
05    12/01/90     P    359    156     72    70     Y
06    01/01/92     D    387    128     62    60     N
06    01/03/92     D    379    128     66    62     Y
06    04/24/92     D    375    132     70    58     N
06    05/01/92     D    365    130     76    66     Y
06    05/28/92     D    321    132     78    68     N
06    06/01/92     D    308    128     72    58     Y
07    01/05/90     P    376    118     68    54     Y
07    04/05/90     P    379    124     72    70     N
07    04/07/90     P    389    120     68    62     Y
07    06/28/90     P    388    124     78    60     Y
07    01/04/91     P    400    128     80    66     N
07    03/03/91     P    401    132     70    80     N
;

/* Create the SAS data set MEDICAL */
DATA SASEXMPL.MEDICAL;
	INFORMAT ADMIT_DT DISCH_DT MMDDYY8. COST COMMA8.2;
	INPUT SUB_ID DIAGCODE ADMIT_DT DISCH_DT HOSPCODE LOS COST;
	FORMAT ADMIT_DT DISCH_DT MMDDYY8.;
DATALINES;
03916  291  04/13/92  04/14/92  19    1   325.00
09243  291  01/21/92  02/15/92  14   25  6000.00
71543  480  03/06/92  03/07/92  18    1   621.00
96298  480  01/06/92  01/18/92  17   12  7050.99
75986  493  01/13/92  01/27/92  18   14  5521.85
96913  493  03/02/92  03/02/92  15    0   200.00
;

/* Create the SAS data set SALES; */
DATA SASEXMPL.SALES;
INPUT PO_NUM ITEM $ REGION $ PRICE QUANTITY;
DATALINES;
1456   Hammer   NORTH  10    5
1458   Saw      NORTH  15    4
1511   Pliers   NORTH   8   35
1600   Hammer   SOUTH  10   15
1711   Hammer   EAST   10   12
1712   Hammer   EAST   10    2
1713   Saw      EAST   15   25
1715   Saw      EAST   15   24
1800   Pliers   EAST    8    7
1900   Saw      WEST   15    9
1901   Saw      WEST   15    5
;
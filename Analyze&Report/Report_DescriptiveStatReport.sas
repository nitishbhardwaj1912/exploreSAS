*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to produce a Descriptive Statistics Report.  						*;
*********************************************************************************************;

title1 = 'Weather Statistics by Year and Park';

*Limit the statistics to two decimal places;
proc means data=pg1.np_westweather Mean Min Max Maxdec=2 ;
	var Precip Snow TempMin TempMax ;
	class Year Name;
run;

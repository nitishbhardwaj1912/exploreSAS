*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to create an output table with custom columns						*;
*********************************************************************************************;

/* Populate the means and create a new table=rainstats */
proc means data=pg1.np_westweather ;
	var Precip ;
	class Name Year;
	where Precip ne 0;
	ways 2;
	output out=rainstats N=RainDays  sum=TotalRain; *create the output table;
run;

/* Print the rainstats table created above */
title1 'Rain Statistics by Year and Park';

/* Create a report using rainstats table */
proc print data=rainstats label noobs;
    var Name Year RainDays TotalRain;
    label Name='Park Name'
          RainDays='Number of Days Raining'
          TotalRain='Total Rain Amount (inches)';
run;

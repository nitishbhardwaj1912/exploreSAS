*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to create Creating two-Way Frequency Reports and process data as  *;
*			per following conditions:  														*;
*  1. Suppress the cumulative column and use use the CROSSLIST								*;										                        *;
*  2. Add a frequency plot that groups the bars by the row variable, 						*;
*     displays row percentages, and has a horizontal orientation.							*;	       									        *;
*********************************************************************************************;

libname PG1 base "/home/u49050836/EPG194/data";

libname out "/home/u49050836/EPG194/output";

/* Turn on ODS Graphics*/
ods graphics on;

title1 'Selected Park Types by Region';
proc freq data=pg1.np_codelookup order=freq; *sort the results by descending frequency;
/*  Suppress the cumulative columns and create a plot to display bars by row */
    tables Type*Region / nocol crosslist 
    plots=freqplot(groupby=row scale=grouppercent orient=horizontal);
	where Type in ('National Historic Site', 'National Monument', 'National Park');
run;
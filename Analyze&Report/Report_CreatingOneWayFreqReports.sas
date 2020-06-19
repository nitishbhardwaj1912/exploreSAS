*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to create Creating One-Way Frequency Reports and process data as  *;
*			per following conditions:  														*;
*  1. Sort the results by descending frequency 												*;										                        *;
*  2. suppress the cumulative columns		       									        *;
*********************************************************************************************;

libname PG1 base "/home/u49050836/EPG194/data";

libname out "/home/u49050836/EPG194/output";

/* Turn on ODS Graphics before the PROC FREQ step and turn off the procedure title */
ods graphics on;
ods noproctitle;

title1 "Categories of Reported Species";
title2 "in the Everglades";
proc freq data=pg1.np_species order=freq; *sort the results by descending frequency;
/*  Suppress the cumulative columns and create a plot to display frequency */
    tables Category / nocum plots=freqplot; 
    where Species_ID like "EVER%" and 
          Category ne "Vascular Plant";
run;
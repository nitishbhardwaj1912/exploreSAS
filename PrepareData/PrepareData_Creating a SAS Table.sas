*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to create a temp table and process data as following conditions:  *;
*  1. Select values from a character YearMonth table having values=2016                     *;
*  2. Convert the values to Comma17 Format.        									        *;
*********************************************************************************************;

data out.eu_occ2016;
	set pg1.eu_occ;
	where  SUBSTR(YearMon, 1, 4) = "2016";
	FORMAT Hotel ShortStay Camp COMMA17.;
	drop Geo;
run;
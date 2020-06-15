*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to create a temp table with new calculated columns				*;
* 			Note: Format Hotel, ShortStay, Camp, and Total with commas.						*;
*				  Format ReportDate to display the values in the form JAN2018. 				*;
*********************************************************************************************;
libname PG1 base "/home/u49050836/EPG194/data";

libname out "/home/u49050836/EPG194/output";

data out.eu_occ_total ;
	set pg1.eu_occ;
    Year=substr(YearMon,1,4); *The four-digit year extracted from YearMon;
    Month=substr(YearMon,6,2); *The two-digit month extracted from YearMon;
	ReportDate = MDY(Month, 1, Year); *The first day of the reporting month;
	Total = sum(Hotel,ShortStay,Camp); *The total nights spent at any establishment;
	keep Country Hotel ShortStay Camp ReportDate Total Month Year;
	format Hotel ShortStay Camp Total comma17. ReportDate monyy7.;
run;
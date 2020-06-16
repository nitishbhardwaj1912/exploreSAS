*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to create a temp table and process data as following conditions:  *;
*  1. Select values where Category is Mammal and (Common_Names includes Fox and excludes    *;
*     Squirrel.) 													                        *;
*  2. Sort the values by Common_Names		       									        *;
*********************************************************************************************;
libname PG1 base "/home/u49050836/EPG194/data";

libname out "/home/u49050836/EPG194/output";

/* Selection Process */
data out.fox;
	set pg1.np_species;
	where  Category  = "Mammal" AND Common_Names like "%Fox%" 
		   AND Common_Names NOT like "%Squirrel%";
	drop Category Record_Status Occurrence Nativeness;
run;

/* Sorting the data */
proc sort Data=out.fox;
	By Common_Names;
run;
*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to generate an Accumulating Column within Multiple Groups	    	*;
*********************************************************************************************;

*create a sorted copy of sashelp.shoes that is ordered by Region and Product;
proc sort data=sashelp.shoes out=sort_shoes;
    by Region Product;
run;

data profitsummary;
    set sort_shoes; *Read sorted data;
    by Region Product;
    *Create a column named Profit that is the difference between Sales and Returns;
    Profit=Sales-Returns;
    *Create an accumulating column named TotalProfit that is a running total of
    Profit within each value of Region and Product;
    if first.Product then TotalProfit=0;
    TotalProfit+Profit;
    if last.Product=1;
    keep Region Product TotalProfit;
    *include only the last row for each Region and Product combination;
    format TotalProfit dollar12.;
run;
*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to Conditionally Creating Columns and Output Tables				*;
*********************************************************************************************;

*keep selective columns;
data camping(keep=ParkName Month DayVisits CampTotal)
    lodging(keep=ParkName Month DayVisits LodgingOther);
    *Read data from table np_2017;
    set pg2.np_2017;
    CampTotal=sum(CampingOther,CampingTent,CampingRV,CampingBackcountry);
    *In the camping table, include only rows that have CampTotal greater than zero;
    if CampTotal > 0 then output camping;
    *In the lodging table, include only rows that have LodgingOther greater than zero;
    if LodgingOther > 0 then output lodging;
    *format CampTotal to comma seperated values;
    format CampTotal comma15.;
run; 
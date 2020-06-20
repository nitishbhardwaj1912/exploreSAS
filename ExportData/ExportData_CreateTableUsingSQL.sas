*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to fetch results using SQL using SAS obs instead of SQL's TOP n	*;
*			syntax																			*;
*********************************************************************************************;

proc sql;

*Create a table;
create table top_damage as
	select Event, 
	       Date format=monyy7.,
	       Cost format=dollar16.
	       from pg1.storm_damage
	       order by Cost desc;
	       
*Add a title for the result;	       
title "Top 10 Storms by Damage Cost";
	*Second query to select only TOP 10 results;
    select *
        from top_damage(obs=10);
quit;
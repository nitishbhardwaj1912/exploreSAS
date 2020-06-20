*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to fetch results using SQL using SAS obs instead of SQL's TOP n	*;
*			syntax. Usage of Inner join to select the data.									*;
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

*Select data using Inner Join;
proc sql;
select Season, Name, SS.Basin, BasinName, MaxWindMPH 
    from pg1.storm_summary as SS inner join pg1.storm_basincodes as SB
		on  SS.Basin = SB.Basin
    order by Season desc, Name;
quit;

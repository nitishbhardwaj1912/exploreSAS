*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to create two temp table and populate each based on conditions	*;		       									        *;
*********************************************************************************************;


data out.parks out.monuments;
    set pg1.np_summary;
	/*Consider data only if Type = NP or NM */
    Where Type IN ("NP","NM");
    Campers=sum(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
    if Type ="NP" then do;
		 ParkType ="Park";
	     output out.parks; *Process Parks table;
	end;
    else do;
		 ParkType="Monument ";
		 output out.monuments; *Process Monuments table;
	end;
	keep Reg ParkName DayVisits OtherLodging Campers ParkType;
run;

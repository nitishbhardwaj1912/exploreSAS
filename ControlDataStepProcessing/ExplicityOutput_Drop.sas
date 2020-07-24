*********************************************************************************************;
*  Developed by: Nitish Bhardwaj  															*;
*															                                *;
*  Purpose: A SAS program to selectively drop columns and explicit output in the tables		*;
*********************************************************************************************;

data monument(drop=ParkType) park(drop=ParkType) other; 
    set pg2.np_yearlytraffic;
    *Explicit Outputs;
    if ParkType = 'National Monument' then output monument;
    else if ParkType = 'National Park' then output park;
    else output other;
    *drop from all tables;
    drop Region;
run;
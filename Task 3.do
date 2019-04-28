*****************************************************
* Stage 2
*****************************************************

********************************************
* Part 1. Summarize Information about variables
* 	by Andrei
********************************************

use "data_171_6.dta", clear

tab mssubclass
graph hbar (count), over (mssubclass)

tab overallqual
graph bar (count), over (overallqual) xsize(15.000)

tab overallcond
graph bar (count), over (overallcond) xsize(15.000)

tab yearbuilt
graph hbar (count), over(yearbuilt) ysize(18.000)

sum miscval, d
twoway histogram miscval || kdensity miscval

tab proxtoroad
graph bar (count), over (proxtoroad)

tab bldgtype
graph bar (count), over (bldgtype)

tab bsmtcond
graph bar (count), over (bsmtcond)

tab miscfeature
graph bar (count), over (miscfeature)
 
sum saleprice, d
twoway histogram saleprice || kdensity saleprice

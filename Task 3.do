*****************************************************
* Stage 2
*****************************************************

********************************************
* Part 1.1 Summarize Information about variables
* 	by Andrei
********************************************
** Building a bar plot for categorical variables (such as mssubclass) 
**   and show some tabular data via tab function

use "data_171_6.dta", clear

tab mssubclass
graph hbar (count), over (mssubclass)

tab overallqual
graph bar (count), over (overallqual) xsize(15.000)

tab overallcond
graph bar (count), over (overallcond) xsize(15.000)

tab yearbuilt
graph hbar (count), over(yearbuilt) ysize(18.000)

tab proxtoroad
graph bar (count), over (proxtoroad)

tab bldgtype
graph bar (count), over (bldgtype)

tab bsmtcond
graph bar (count), over (bsmtcond)

tab miscfeature
graph bar (count), over (miscfeature)

**Building a histogram with kernal density plot on numeric variables below
** and searching mean, variance and distribution via sum function with descriptive option "d"

sum miscval, d
twoway histogram miscval || kdensity miscval
 
sum saleprice, d
twoway histogram saleprice || kdensity saleprice

********************************************
* Part 1.2 Graphical Analysis
* 	by Andrei
********************************************

use "data_171_6.dta", clear

**Building box plots for pair of numeric and each categorical variables

graph box saleprice, over(mssubclass) xsize(20.000) scale(0.5)

graph box saleprice, over(overallqual) xsize(15.000)

graph box saleprice, over(overallcond) xsize(15.000)
 
graph hbox saleprice, over(yearbuilt) ysize(20.000)
 
graph box saleprice, over(proxtoroad) xsize(7.000) 

graph box saleprice, over(bldgtype) xsize(10.000)

graph box saleprice, over(bsmtcond) xsize(10.000)

graph box saleprice, over(miscfeature) xsize(8.000) ysize(15.000)

******

graph box miscval, over(mssubclass) xsize(20.000) scale(0.55)

graph box miscval, over(overallqual) xsize(15.000)

graph box miscval, over(overallcond) xsize(15.000)

graph hbox miscval, over(yearbuilt) ysize(20.000)

graph box miscval, over(proxtoroad) xsize(7.000)

graph box miscval, over(bldgtype) xsize(7.000)

graph box miscval, over(bsmtcond) xsize(7.000)

graph box miscval, over(miscfeature) xsize(7.000)

******
**Building scatter plots 
** for pair of dependent variable and each of independent variable

twoway scatter saleprice mssubclass || lfit saleprice mssubclass

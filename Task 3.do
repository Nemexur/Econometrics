
********************************************
* Part 1.1 Summarize Information about variables
* 	by Andrei
********************************************
** Building a bar plot for categorical variables (such as mssubclass) 
**   and show some tabular data via tab function

use "data_171_6.dta", clear

tab mssubclass, sort
graph hbar (count), over (mssubclass)

tab overallqual, sort
graph bar (count), over (overallqual) xsize(15.000)

tab overallcond, sort
graph bar (count), over (overallcond) xsize(15.000)

tab yearbuilt, sort
graph hbar (count), over(yearbuilt) ysize(18.000)

tab proxtoroad, sort
graph bar (count), over (proxtoroad)

tab bldgtype
graph bar (count), over (bldgtype)

tab bsmtcond, sort
graph bar (count), over (bsmtcond)

tab miscfeature
graph bar (count), over (miscfeature)

**Building a histogram with kernal density plot on numeric variables below
** and searching mean, variance and distribution via sum function with descriptive option "d"

sum miscval, d
twoway histogram miscval || kdensity miscval
 
sum saleprice, d
twoway histogram saleprice || kdensity saleprice

sum garagearea, d
twoway histogram garagearea || kdensity garagearea

sum grlivarea, d
twoway histogram grlivarea || kdensity grlivarea
********************************************
* Part 1.2 Graphical Analysis
* 	by Andrei
********************************************

use "data_171_6.dta", clear

**Building box plots for pair of numeric and each categorical variables

**** For Saleprice (the only dependent variable)

graph box saleprice, over(mssubclass) xsize(20.000) scale(0.5)

graph box saleprice, over(overallqual) xsize(15.000)

graph box saleprice, over(overallcond) xsize(15.000)
 
graph hbox saleprice, over(yearbuilt) ysize(20.000)
 
graph box saleprice, over(proxtoroad) xsize(7.000) 

graph box saleprice, over(bldgtype) xsize(10.000)

graph box saleprice, over(bsmtcond) xsize(10.000)

graph box saleprice, over(miscfeature) xsize(8.000) ysize(15.000)

****** For Miscval

graph box miscval, over(mssubclass) xsize(20.000) scale(0.55)

graph box miscval, over(overallqual) xsize(15.000)

graph box miscval, over(overallcond) xsize(15.000)

graph hbox miscval, over(yearbuilt) ysize(20.000)

graph box miscval, over(proxtoroad) xsize(7.000)

graph box miscval, over(bldgtype) xsize(7.000)

graph box miscval, over(bsmtcond) xsize(7.000)

graph box miscval, over(miscfeature) xsize(7.000)

****** For Grlivarea

graph box grlivarea, over(mssubclass) xsize(20.000) scale(0.5)

graph box grlivarea, over(overallqual) xsize(15.000)

graph box grlivarea, over(overallcond) xsize(15.000)

graph hbox grlivarea, over(yearbuilt) ysize(20.000)

graph box grlivarea, over(proxtoroad) xsize(7.000)

graph box grlivarea, over(bldgtype) xsize(7.000)

graph box grlivarea, over(bsmtcond) xsize(7.000)

graph box grlivarea, over(miscfeature) xsize(7.000)

****** For Garagearea

graph box garagearea, over(mssubclass) xsize(20.000) scale(0.5)

graph box garagearea, over(overallqual) xsize(15.000)

graph box garagearea, over(overallcond) xsize(15.000)

graph hbox garagearea, over(yearbuilt) ysize(20.000)

graph box garagearea, over(proxtoroad) xsize(7.000)

graph box garagearea, over(bldgtype) xsize(7.000)

graph box garagearea, over(bsmtcond) xsize(7.000)

graph box garagearea, over(miscfeature) xsize(7.000)



******
**Building scatter plots 
** for pair of dependent variable and each of independent numeric variable

twoway scatter saleprice miscval || lfit saleprice miscval

twoway scatter saleprice grlivarea || lfit saleprice grlivarea

twoway scatter saleprice garagearea || lfit saleprice garagearea

// *****************************************************
// Part 3.2: Correlation analysis
// *****************************************************

/*
Correlation between the building class and the sale price 
*/
spearman mssubclass saleprice

/*
Correlation between the overall material and finishing quality and the sale price 
*/
spearman overallqual saleprice

/*
Correlation between the overall condition quality and the sale price 
*/
spearman overallcond saleprice

/*
Correlation between the original construction year and the sale price 
*/
pwcorr yearbuilt saleprice, sig star(.05) obs

/*
Correlation between the $ value of miscellaneous features and the sale price 
*/
pwcorr miscval saleprice, sig star(.05) obs

/*
Correlation between the to the main road and the sale price 
*/
spearman proxtoroad saleprice

/*
Correlation between the type of dwelling and the sale price 
*/
spearman bldgtype saleprice

/*
Correlation between the general condition of the basement and the sale price 
*/
spearman bsmtcond saleprice

/*
Correlation between the presense of any other misc features and the sale price 
*/
spearman miscfeature saleprice

/*
Correlation between the above ground sq feet area and the sale price 
*/
pwcorr grlivarea saleprice, sig star(.05) obs

/*
Correlation between the size of garage and the sale price 
*/
pwcorr garagearea saleprice, sig star(.05) obs

/*
Correlation between all independent variables
*/
spearman mssubclass overallqual overallcond yearbuilt miscval proxtoroad bldgtype bsmtcond miscfeature grlivarea garagearea, star(.05)

/*
Cross-tabular correlation for all categorical variables
*/
tab2 mssubclass overallqual overallcond proxtoroad bldgtype bsmtcond miscfeature, V


// *****************************************************
// Part 3: Hypothesis testing based on the descriptive statistics 
// *****************************************************

/*
Hypothesis 1
*/

// *****************************************************

// On the beginning let's check the normal distribution without outliers
hist saleprice if saleprice < 600000

// Assume that significance level is 95%

// Let's test hypotheses
ttest saleprice == 180921, level(95)

// *****************************************************

/*
Hypothesis 2
*/

// *****************************************************

// On the beginning let's check the normal distribution without outliers
hist grlivarea if grlivarea < 4000

// Assume that significance level is 90%

// Let's test hypotheses
ttest grlivarea == 1500, level(90)

// *****************************************************

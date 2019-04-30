// *****************************************************
// Part 2: Correlation analysis
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

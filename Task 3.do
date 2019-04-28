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

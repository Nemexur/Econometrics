/*
STAGE: 4
*/

use "data_171_6.dta", clear

// First of all lets preserve dataset so we can go back to the initial one
preserve

// Make saleprice, grlivarea, garagearea normally distributed
gen log_saleprice = ln(saleprice)
gen log_grlivarea = ln(grlivarea)
gen log_garagearea = ln(garagearea + 1e-8)

// Set seed for random uniform
set seed 13
// Generate random variable
gen random = uniform()
// Sort dataset via random
sort random

count
scalar total_count = r(N)

// Generate byte variable which indicates training or validation row
gen byte validation = _n <= total_count * 0.2 

// 4.3 Estimation of basic model

reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt miscval proxtoroad bsmtcond bldgtype overallcond miscfeature if !validation
 
// 4.4 Heteroscedasticity analysis
 
// Scatter plot of residuals
rvfplot, yline(0)

// Cook-Weisberg Test
estat hettest

// Brush-Pagan Test
predict e, residuals
gen e2 = e^2
reg e2 log_garagearea log_grlivarea overallqual yearbuilt miscval proxtoroad bsmtcond bldgtype overallcond miscfeature if !validation

// White Test
// Once again run the initial test
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt miscval proxtoroad bsmtcond bldgtype overallcond miscfeature if !validation
predict yhat, xb
gen yhat2 = yhat^2
reg yhat2 log_garagearea log_grlivarea overallqual yearbuilt miscval proxtoroad bsmtcond bldgtype overallcond miscfeature if !validation

// 4.5 Hypothesis testing based on the regression analysis

// Hypothesis 1
// Regression model for hypothesis
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt miscval proxtoroad bsmtcond bldgtype overallcond miscfeature if !validation
test proxtoroad miscval

// Hypothesis 2
// Regression model for hypothesis
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt bsmtcond bldgtype overallcond miscfeature if !validation
test log_garagearea = overallqual

// Hypothesis 3
// Regression model for hypothesis
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt bsmtcond bldgtype overallcond miscfeature if !validation
test miscfeature

// Hypothesis 4
// Regression model for hypothesis
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt bsmtcond bldgtype overallcond if !validation
test bsmtcond

// Hypothesis 5
// Regression model for hypothesis
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt bldgtype overallcond if !validation
test log_garagearea log_grlivarea overallqual yearbuilt bldgtype overallcond

// Restore command to undo all changes. Uncomment this line of code if you need
// restore

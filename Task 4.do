//*****************************************************************
// STAGE: 4
//*****************************************************************

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

//*****************************************************************
// 4.3 Estimation of basic model
//*****************************************************************

reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt miscval proxtoroad bsmtcond bldgtype overallcond miscfeature if !validation
 
//*****************************************************************
// 4.4 Heteroscedasticity analysis
//*****************************************************************
 
// Scatter plot of residuals
rvfplot, yline(0)

// Brush-Pagan/Cook-Weisberg Test
// Once again run the initial test
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt miscval proxtoroad bsmtcond bldgtype overallcond miscfeature if !validation
estat hettest

// White Test
// Once again run the initial test
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt miscval proxtoroad bsmtcond bldgtype overallcond miscfeature if !validation
imtest, white

// Heteroscedasticity-robust standard error estimates
// Просто записать ту же модель, что и в 4.3 для этого кейса
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt miscval proxtoroad bsmtcond bldgtype overallcond miscfeature if !validation, r

//*****************************************************************
// 4.5 Hypothesis testing based on the regression analysis
//*****************************************************************

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

// Hypothesis 6
// Regression model for hypothesis
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt bldgtype overallcond if !validation
estat ovtest

//*****************************************************************
// 4.6 Alternative model specifications 
//*****************************************************************

// First Model
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt bldgtype overallcond if !validation
estat ic

// Second Model
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt bsmtcond bldgtype overallcond miscfeature if !validation
estat ic

// Далее просто сравнить результат и сказать у какой из низ меньше AIC. Та у которой он меньше будет лучше

//*****************************************************************
// 4.7 Forecasting
//*****************************************************************

// Once again run the initial test
reg log_saleprice log_garagearea log_grlivarea overallqual yearbuilt bldgtype overallcond if !validation
predict y_hat if validation, xb

// Restore command to undo all changes. Uncomment this line of code if you need
// restore

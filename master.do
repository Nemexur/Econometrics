******************************************************************************************************************************
*
*
*	 Member of the project team (names): Smetanin Ilya, Milogradskiy Alexandr, Rykov Andrei
*	 Academic group:				     BI 171
*
*	 Project title:						Research fo house pricing in US
* 
*	 Data sets used: 					House Prices
*	 Link to the data set: 				https://www.kaggle.com/
*
*	 Stage of the project:				Stage 2
*
*	 E-Mail of a contact person: 		agrykov@edu.hse.ru
* 
*
*
*	 Short desciption of the programme code:	Please delineate shortly the steps of your analysis
*
*							1_data_preparation: Preparation of original data
* 							???? WRITE DOWN ????
*
*							2_descriptive_analysis: Understanding of analyzed subsample data
*							???? WRITE DOWN ????
*
* 
*	 Used variables: 		???? WRITE DOWN ????
*
*	 mssubclass				the building class
*	 overallqual			Overall material and finish quality
*	 overallcond			Overall condition rating
*	 yearbuilt				Original construction date
* 	 miscval				Value of miscellaneous feature
*	 proxtoroad				Proximity to main road or railroad
*	 bldgtype 				Type of dwelling
*	 bsmtcond 				General condition of the basement
*	 miscfeature 	  		Miscellaneous feature not covered in other categories
*	 saleprice 				The property's sale price in dollars
*	 grlivarea				Above grade (ground) living area square feet
*	 garagearea 			Size of garage in square feet
*
*
******************************************************************************************************************************


******************************************************************************************************************************
*	 Stage 1. Preparation of micro data 
******************************************************************************************************************************

* ???? WRITE DOWN ????

******************************************************************************************************************************
*	 Stage 2. Descriptive statistics 
******************************************************************************************************************************

log using log_Task3.log, replace

// Set your file path to Task 3.do
do "Task 3.do"

log close


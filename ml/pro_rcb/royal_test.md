# Data Analytics & AI - Royal Caribbean - Interview Questions 

### Introduction

Congratulations on making it to this stage of the interview process! For the next step of your candidacy, you will be asked to solve three unique problems; each one focuses on a distinct skill such as python coding, exploratory analysis, and model, development and use. Any libraries you wish to use are acceptable but please use Python and include all code and derived data in your final submission. Document formats such as .ipynb, .py, .rmd, .html, .xlsx, .pdf, and .docx are acceptable for submission. 


For all questions below, be sure to thoroughly document your work as well as any assumptions you make with the data. For example, it is okay to make assumptions with the data (i.e. what is an outlier, etc), but be sure to state it. 


If you submitted any code, we are going to try and run it, so please write your code neatly as it will be read by others. You are allowed to use any libraries that you choose. If it references obscure libraries, please indicate this as well as how to locate/install them. You need to be sure you do what the core task indicates; be sure that your answer or model you build is actually solving the business problem given but, you should feel free to use novel and ingenious approaches. We do not want you to spend money for any API usage or external service; the project is expected to be completed within the free tier of any service. Based on the feedback from other candidates we also expect that the challenge should not take more than four hours to complete. 


Show all work. (i.e. If you try multiple models, show us.) We want to see everything that helped you arrive at your final answer. 

Some of the things we will look when evalutating your submissions: 

1. Completeness and correctness of the project and codebase. 

2. Robustness and clarity of the documentation included with the submission. 

3. Sophistication and ingenuity in thinking and approach. 

5. Correct use of libraries, python coding best practices, and git. 


`Hint:` Clarity means articulating the approach and results cleanly and concisely. Overly verbose code and responses can be detrimental to your score. 


Commit your work often so we can see how your work evolved over time. When you have completed the challenge, push your code and results to the repo.

`Notice of Confidentiality:` This document, scenario, and data are proprietary to Royal Caribbean Group, Inc. And cannot be copied or distributed without the expressed written permission by Royal Caribbean International, Inc. Failure to adhere to this notice of confidentiality will result in the immediate termination of the candidate's application and could result in legal action. 


## Part 1 - Code refactoring 

Please refine the code in outlier_removal. This is an open ended code refactoring. Feel free to:

1. Improve the code functionality
2. Optimize performance
3. Productionize the code

Or work through all three! 

This is an opportunity to showcase your development skills but be sure to leave yourself time to complete parts 2 and 3. 
 

## Part 2 - EDA 

In the zip file you will find a dataset called satistfaction.csv This dataset contains information about airline passengers, their trip, and whether or not they were satisfied. This data is from a survey so make the assumption that a higher number is better in columns like `Ease of Online booking'. The satisfied\_v2 column is something that is a verified customer sentiment via customer service representatives reaching out to the customer. 

 Your business leaders have asked you to investigate how big of a problem we have with unsatisfied passengers as well as what might be causing it. 

 

In this part, we ask that you perform an exploratory data analysis into the dataset while also trying to answer the business leaders' question. Feel free to be as concise or as thorough as you'd like. 

 

## Part 3 - Modeling 

The business leaders were impressed with the analysis. They now want you to build a model that can predict if a customer was not satisfied by their flight immediately after they submit a survey. Customer service representatives are very busy so we need to prioritize who to reach out to first. 

Using the data, build the best model you can given the data that does what the business leaders are asking. Does this business case influence the model you ended up choosing? Be sure to explain! 

How accurate is this model? (Use whatever accuracy metrics you think are relevant.) 

Be sure to explain any assumptions you make and show all steps you took to get to your final model. 

Now it is time to put the model in production. You have an additional `satisfaction_prod.csv` dataset that is new data the model hasn't been trained or tested on yet with unkown target. Use your trained model to predict on this dataset and save your results to `satisfaction_prod_predictions.csv`. Be sure to save the script you used to predict on this dataset. 
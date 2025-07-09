---
title: 'R Statistics'
output:
  html_document:
    df_print: paged
  pdf_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```



--------------------------------------------------------------------------------------


## Problem 1

Refer to the Grade point average Data. The director of admissions of a small college selected 120 students at random from the new freshman class in a study to determine whether a student's grade point average (GPA) at the end of the freshman year (Y) can be predicted from the ACT test score (X). (40 points)

a-) Import the data into R (10 points)

> Solution

```{r problem 1a}
GPAInput <- read.csv("/cloud/project/Assignment 1_Qingyang/Grade Point Average Data.csv")
```


b-)	Plot the ACT against GPA and comment on the relationship (10 points)

> Solution

```{r problem 1b}

#lmFit = lm(Y~X, GPAInput)
#summary(lmFit)

lmFit <- lm(Y~X, data=GPAInput)

plot(GPAInput$X, GPAInput$Y, xlab="X", ylab="Y")
abline(lmFit)


```
<p style="color:blue">Comment: Based on data, seems like Y increases as X increases. It could be a positive correlation, but will confirm using correlation and regression in (c) and (d).</p>


c-) Calculate the correlation between ACT and GPA (10 points)

> Solution


```{r problem 1c}

res <- cor.test(GPAInput$X, GPAInput$Y, method = "pearson")
res
```

<p style="color:blue">Comment: positive correlation with number 0.2694818</p>
	
d-) Build a regression model and comment on the intercept and slope (10 points)

```{r 1d}
lmFit <- lm(Y~X, data=GPAInput)
summary(lmFit)
```
<p style="color:blue">Comment: We see that the estimated regression function is: Y = 2.11405 + 0.03883X </p>


## Problem 2 

The dataset uswages is drawn as a sample from the Current Population Survey in 1988. You can download this data set by installing faraway library. To get the data set, copy and paste the r command: install.packages("faraway"); data(uswages, package="faraway").

The wage is the response variable. Please see below for the full list of variables.


wage: Real weekly wages in dollars (deflated by personal consumption expenditures - 1992 base year)

educ:Years of education

exper:Years of experience

race:1 if Black, 0 if White (other races not in sample)

smsa:1 if living in Standard Metropolitan Statistical Area, 0 if not

ne:1 if living in the North East

mw:1 if living in the Midwest

we:1 if living in the West

so:1 if living in the South

pt:1 if working part time, 0 if not


a-) How many observations are in the data set?

```{r}
install.packages("faraway"); data(uswages, package="faraway")
```

>solution

<p style="color:blue">2000 observations.</p>


b-) Calculate the mean and median of each variable. Are there any outliers in the data set? 

>wage mean


```{r wage mean}
mean(uswages$wage)
```
>wage median

```{r wage median}
median(uswages$wage)
```
>educ mean

```{r educ mean}
mean(uswages$educ)
```

>educ median

```{r educ median}
median(uswages$educ)
```

>exper mean

```{r exper mean}
mean(uswages$exper)
```

>exper median

```{r exper median}
median(uswages$exper)
```
>race mean

```{r race mean}
mean(uswages$race)
```

>race median

```{r race median}
median(uswages$race)
```

>smsa mean

```{r smsa mean}
mean(uswages$smsa)
```

>smsa median

```{r smsa median}
median(uswages$smsa)
```

>ne mean

```{r ne mean}
mean(uswages$ne)
```

>ne median

```{r ne median}
median(uswages$ne)
```

>mw mean

```{r mw mean}
mean(uswages$mw)
```

>mw median

```{r mw median}
median(uswages$mw)
```

>so mean

```{r so mean}
mean(uswages$so)
```

>so median

```{r so median}
median(uswages$so)
```

>we mean

```{r we mean}
mean(uswages$we)
```

>we median

```{r we median}
median(uswages$we)
```

>pt mean

```{r pt mean}
mean(uswages$pt)
```

>pt median

```{r pt median}
median(uswages$pt)
```
>find wage outlier

```{r}
boxplot(uswages$wage,
  ylab = "Value"
)
```
<p style="color:blue">Comment: as I plot the boxplot for wage, we can see there are some outliers.</p>


c-) Calculate the correlation among wage,education and experience. Plot each of the predictors against the response variable. Identify the variables that are strongly correlated with the response variable.

```{r}
# Load data
my_data <- uswages[, c(1,2, 3)]
# print the first 6 rows
head(my_data, 6)
```

>Correlation

```{r}
res <- cor(my_data)
round(res, 4)

```
>plot

```{r}
library(corrplot)
corrplot(res, type = "upper", order = "hclust",tl.col = "red", tl.srt = 30)
```
<p style="color:blue">Comment: as I plot the correlogram, we can see there are no strong correlation. No correlation value is beyond 0.6 or less than -0.6</p>


d-) Is there difference in wages based on race?

>correlation between wages vs. race

```{r}
cor(uswages$wage,uswages$race, method = c("pearson", "kendall", "spearman"))
```
<p style="color:blue">Comment: the correlation between wages and race is very small, i.e. -0.096, we can conclude there is almost no difference in wages based on race. </p>

e-) Build a regression model by using only education to predict the response variable. State the regression model.

>Regression model using education

```{r}
lmWage = lm(uswages$wage~uswages$educ, data = uswages) #Create the linear regression
summary(lmWage)
```
<p style="color:blue">Comment: the linear regression model by only using education to predict the wages is: Wage=109.754+38.011*Education Year  </p>


f-) Build a regression model by using only experience to predict the response variable. State the regression model.

>Regression model using experience

```{r}
lmWagevsExp = lm(uswages$wage~uswages$exper, data = uswages) 
summary(lmWagevsExp)
```
<p style="color:blue">Comment: the linear regression model by only using experience to predict the wages is: Wage=492.1669+6.2981*Experience Year  </p>

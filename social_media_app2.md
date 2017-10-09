---
title: "A Shiny App"
author: "Mary T."
date: "October 8, 2017"
output: ioslides_presentation
---

## Social Media Facts

- Today around seven-in-ten Americans use social media to connect with one another, engage with news content, share information and entertain themselves.
- According to the Pew Research Center social media adoption by American adults has increased from 5% in 2005 to over 70% today. (http://www.pewinternet.org/fact-sheet/social-media/).
- Young adults were among the earliest social media adopters and continue to use these sites at high levels, but usage by older adults has increased in recent years.
- This application looks at the data trends by age and gender.
- It also calculates a non-scientific loss of productivity (years) based on gender and hours spent on social media.

## Data structure




```r
str(age_SM)
```

```
## 'data.frame':	27 obs. of  5 variables:
##  $ Period  : Date, format: "2005-03-21" "2005-12-08" ...
##  $ X18_29  : num  0.07 0.16 0.41 0.59 0.6 0.65 0.67 0.67 0.68 0.7 ...
##  $ X30_49  : num  0.06 0.09 0.06 0.28 0.21 0.27 0.3 0.44 0.27 0.42 ...
##  $ X50_64  : num  0.04 0.05 0.03 0.08 0.07 0.1 0.12 0.21 0.09 0.2 ...
##  $ X65_plus: num  0.03 0.02 0 0.03 0.02 0.03 0.02 0.06 0.02 0.05 ...
```


```r
str(gender_SM)
```

```
## 'data.frame':	28 obs. of  3 variables:
##  $ Period: Date, format: "2005-03-21" "2005-12-08" ...
##  $ Men   : num  0.06 0.1 0.13 0.21 0.25 0.25 0.26 0.25 0.33 0.36 ...
##  $ Women : num  0.04 0.08 0.1 0.22 0.27 0.24 0.29 0.26 0.38 0.37 ...
```


## Data summary


```r
head (age_SM, 5)
```

```
##       Period X18_29 X30_49 X50_64 X65_plus
## 1 2005-03-21   0.07   0.06   0.04     0.03
## 2 2005-12-08   0.16   0.09   0.05     0.02
## 3 2006-08-31   0.41   0.06   0.03     0.00
## 4 2008-12-20   0.59   0.28   0.08     0.03
## 5 2008-05-11   0.60   0.21   0.07     0.02
```

```r
head (gender_SM, 5)
```

```
##       Period  Men Women
## 1 2005-03-21 0.06  0.04
## 2 2005-12-08 0.10  0.08
## 3 2006-08-31 0.13  0.10
## 4 2008-05-11 0.21  0.22
## 5 2008-08-10 0.25  0.27
```


## Application

<iframe width="700" height="700"
  src="https://mst0722.shinyapps.io/Survey_app/_w_24f51e27/#" 
  frameborder="0" 
  allowfullscreen> </iframe>




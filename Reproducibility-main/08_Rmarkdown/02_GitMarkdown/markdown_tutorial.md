---
title: "Tutorial Rmarkdown"
output: 
  html_document:
    keep_md: yes
  word_document: default
---



## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for 
authoring HTML, PDF, and MS Word documents. For more details on using R Markdown 
see <http://rmarkdown.rstudio.com>.

It uses `knitr`, `rmarkdown` and [`pandoc`](http://pandoc.org/).  Pandoc is a 
universal document converter, in our case, it goes from:

**Rmarkdown** => **markdown** => **document**

##Syntax
###Emphasis

`*italic*` => *italic*

`_italic_` => _italic_

`**bold**` => **bold**

`__bold__` => __bold__

###Headers
```
# Header 1

## Header 2

### Header 3
```
###Lists
#### Unordered
```
* Item1
  + Item 1a #double tab
* Item 2
```
* Item1
    + Item 1a
* Item 2

#### Ordered
```
1. Item1
    + Item 1a
2. Item 2
```
1. Item1
    + Item 1a
2. Item 2

### Links
Use plain address either as an actual link, within the text or linked to a word:
```
http://www.fieldcroppathology.msu.edu/
<http://www.fieldcroppathology.msu.edu/>
[Chilvers lab](http://www.fieldcroppathology.msu.edu/)

```

<http://www.fieldcroppathology.msu.edu/>

[Chilvers lab](http://www.fieldcroppathology.msu.edu/)

### Images
```
#If you forgot the exclamation mark (!), it will become just a link
![Chilves lab photo](IMG_8889-Copy.jpg)
```

![Chilves lab photo](IMG_8889-Copy.jpg)


###Tables
```
First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell
```

First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell

You can make this process simpler using knitr with `kable`:

```r
kable(head(ggplot2::mpg, n = 15), digits = 3, format = "markdown")
```



|manufacturer |model      | displ| year| cyl|trans      |drv | cty| hwy|fl |class   |
|:------------|:----------|-----:|----:|---:|:----------|:---|---:|---:|:--|:-------|
|audi         |a4         |   1.8| 1999|   4|auto(l5)   |f   |  18|  29|p  |compact |
|audi         |a4         |   1.8| 1999|   4|manual(m5) |f   |  21|  29|p  |compact |
|audi         |a4         |   2.0| 2008|   4|manual(m6) |f   |  20|  31|p  |compact |
|audi         |a4         |   2.0| 2008|   4|auto(av)   |f   |  21|  30|p  |compact |
|audi         |a4         |   2.8| 1999|   6|auto(l5)   |f   |  16|  26|p  |compact |
|audi         |a4         |   2.8| 1999|   6|manual(m5) |f   |  18|  26|p  |compact |
|audi         |a4         |   3.1| 2008|   6|auto(av)   |f   |  18|  27|p  |compact |
|audi         |a4 quattro |   1.8| 1999|   4|manual(m5) |4   |  18|  26|p  |compact |
|audi         |a4 quattro |   1.8| 1999|   4|auto(l5)   |4   |  16|  25|p  |compact |
|audi         |a4 quattro |   2.0| 2008|   4|manual(m6) |4   |  20|  28|p  |compact |
|audi         |a4 quattro |   2.0| 2008|   4|auto(s6)   |4   |  19|  27|p  |compact |
|audi         |a4 quattro |   2.8| 1999|   6|auto(l5)   |4   |  15|  25|p  |compact |
|audi         |a4 quattro |   2.8| 1999|   6|manual(m5) |4   |  17|  25|p  |compact |
|audi         |a4 quattro |   3.1| 2008|   6|auto(s6)   |4   |  17|  25|p  |compact |
|audi         |a4 quattro |   3.1| 2008|   6|manual(m6) |4   |  15|  25|p  |compact |

When you click the **Knit**, it will render the document using the existing syntax.

__________


## R chunks

You can embed an R code chunk like this:


```r
summary(cars)
```

```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

You can control the output of your chunks using different parameters:

```r
#{r chunk_name, ...}

#Global parameters
#```{r setup, include=FALSE}
#knitr::opts_chunk$set(echo = TRUE)
#```
```

![Parameters](chunk_parameters.png)


## Including Plots
You can also embed plots, for example in this case using `echo=FALSE` only the 
plot will be displayed:

![](markdown_tutorial_files/figure-html/pressure-1.png)<!-- -->

Or if you have multiple plots:
```
## Sales Report {.tabset}
 
### By Product
 
(tab content)
 
### By Region
 
(tab content)
```
## Multiple plots {.tabset}
 
### By class
 

```r
g <- ggplot(mpg, aes(class))
# Number of cars in each class:
g + geom_bar()
```

![](markdown_tutorial_files/figure-html/unnamed-chunk-1-1.png)<!-- -->
 
### Boxplot
 

```r
p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot()
```

![](markdown_tutorial_files/figure-html/unnamed-chunk-2-1.png)<!-- -->


### Miscelaneous

```r
# Extract r code
knit("markdown_tutorial.Rmd", "R-code_markdown.R", tangle = TRUE)
```

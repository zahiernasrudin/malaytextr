# malaytextr

Bahasa Malaysia NLP Package for R

<!-- badges: start -->

[![CRAN status](https://www.r-pkg.org/badges/version/malaytextr)](https://CRAN.R-project.org/package=malaytextr) [![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable) [![Codecov test coverage](https://codecov.io/gh/zahiernasrudin/malaytextr/branch/master/graph/badge.svg)](https://app.codecov.io/gh/zahiernasrudin/malaytextr/branch/master) [![](https://cranlogs.r-pkg.org/badges/grand-total/malaytextr)](https://cran.r-project.org/package=malaytextr) <!-- badges: end -->

## Features

-   Malayrootwords dictionary
-   Malaystopwords dictionary (Development version)
-   Stemming words
-   Remove URLs (New function: 13 August 2021)

## Installation

Install the latest version of this package by entering the following in R:

``` r
install.packages("malaytextr")
```

Or you can install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("zahiernasrudin/malaytextr")
```

## Examples

### Malay root words

There is a data frame of Malay root words that can be used as a dictionary:

``` r
malayrootwords

# A tibble: 4,365 x 2
   `Col Word` `Root Word`
   <chr>      <chr>      
 1 ad         ada        
 2 ak         aku        
 3 akn        akan       
 4 ank        anak       
 5 ap         apa        
 6 awl        awal       
 7 bg         bagi       
 8 bkn        bukan      
 9 blm        belum      
10 bnjr       banjir     
# ... with 4,355 more rows
```

### Stem Malay words

`stem_malay()` will find the root words in a dictionary, in which the `malayrootwords` data frame can be used, then it will remove "extra suffix"", "prefix" and lastly "suffix"

To stem word "banyaknya". It will return a data frame with the word "banyaknya" and the stemmed word "banyak":

**Note: In the development version, 'Root Word' is now returned instead of 'root_word'**

``` r
stem_malay(word = "banyaknya", dictionary = malayrootwords)

'Root Word' is now returned instead of 'root_word'
   Col Word Root Word
1 banyaknya    banyak
```

To stem words in a data frame:

1.  Specify the data frame
2.  Specify the dictionary
3.  Specify the column that needs to be stemmed

``` r
x <- data.frame(text = c("banyaknya","sangat","terkedu", "pengetahuan"))

stem_malay(word = x, 
          dictionary = malayrootwords, 
          col_feature1 = "text")
  
'Root Word' is now returned instead of 'root_word'
     Col Word Root Word
1   banyaknya    banyak
2      sangat    sangat
3     terkedu      kedu
4 pengetahuan      tahu
```

### Remove URLs

`remove_url` will remove all urls found in a string

``` r
x <- c("test https://t.co/fkQC2dXwnc", "another one https://www.google.com/ to try")

remove_url(x)

[1] "test "               "another one  to try"
```

### Malay stop words

In the development version, there is a data frame of Malay stop words:

``` r
malaystopwords
# A tibble: 512 x 1
   stopwords
   <chr>    
 1 ada      
 2 sampai   
 3 sana     
 4 itu      
 5 sangat   
 6 saya     
 7 jadi     
 8 se       
 9 agak     
10 jangan   
# ... with 502 more rows
```


## Report a bug

To report a bug, please file an issue on [Github](https://github.com/zahiernasrudin/malaytextr/issues)

------------------------------------------------------------------------

MIT License

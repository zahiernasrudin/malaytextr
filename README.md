# malaytextr

malaytextr: An R package to process Malay text data. It offers a number of functions/datasets for analyzing and working with text data in the Malay language.


<!-- badges: start --> 
[![CRAN status](https://www.r-pkg.org/badges/version/malaytextr)](https://CRAN.R-project.org/package=malaytextr) [![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable) [![Codecov test coverage](https://codecov.io/gh/zahiernasrudin/malaytextr/branch/master/graph/badge.svg)](https://app.codecov.io/gh/zahiernasrudin/malaytextr/branch/master) [![](https://cranlogs.r-pkg.org/badges/grand-total/malaytextr)](https://cran.r-project.org/package=malaytextr) 

<!-- badges: end -->





## Features

-   Malayrootwords dictionary (Added more words; Development version: 9 March 2023)
-   Malaystopwords dictionary
-   Stemming words
-   Remove URLs
-   Sentiment words (Added more words; Development version: 20 March 2023)
-   Normalized words
-   Malaysia Politic Tweets Sentiment Dataset (Development version: 22 June 2023)

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

# A tibble: 4,310 × 2
   `Col Word`  `Root Word`
   <chr>       <chr>      
 1 pengabadian abadi      
 2 pengabdian  abdi       
 3 pengacaraan acara      
 4 pengadangan adang      
 5 pengadilan  adil       
 6 pengairan   air        
 7 pengakaran  akar       
 8 pengaktifan aktif      
 9 pengalaman  alam       
10 pengaman    aman       
# … with 4,300 more rows
```

### Stem Malay words

`stem_malay()` will find the root words in a dictionary, in which the `malayrootwords` data frame can be used, then it will remove "extra suffix"", "prefix" and lastly "suffix"

To stem word "banyaknya". It will return a data frame with the word "banyaknya" and the stemmed word "banyak":

**Note: 'Root Word' is now returned instead of 'root_word'**

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

There is a data frame of Malay stop words:

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

### Sentiment words

This lexicon includes words that have been labelled as positive or negative:

``` r
sentiment_general
# A tibble: 1,428 × 2
   Word      Sentiment
   <chr>     <chr>    
 1 aduan     Negative 
 2 agresif   Negative 
 3 amaran    Negative 
 4 anarki    Negative 
 5 ancaman   Negative 
 6 aneh      Negative 
 7 antagonis Negative 
 8 anti      Negative 
 9 azab      Negative 
10 babi      Negative 
# … with 1,418 more rows
```


### Normalized words

Aims to provide a standardized version of Malay words. It is designed to standardize words that have multiple variations/spellings

```r

normalized
# A tibble: 153 × 2
   `Col Word` `Normalized Word`
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
# … with 143 more rows

```

### Malaysia Politic Tweets Sentiment Dataset (Development Version)

A collection of tweets related to Malaysian politics. Can be used for various tasks such as political sentiment analysis

```r

malaysia_politic_sentiment
# A tibble: 71 × 3
      id text                                                                                      sentiment
   <dbl> <chr>                                                                                     <chr>    
 1    21 "@azrulazimi @AbdMydin Lets gooo PH💪\n\n#KitaBoleh \n#PakatanHarapan"                    Positive 
 2    39 "Catatan Duha\nJangan bekerja secara solo, natijahnya tidak akan memberi impak yang ting… Negative 
 3    19 "@anwaribrahim saya pengundi PH P.107 sebelum ini akan menolak calon yg PH meletak di Su… Negative 
 4    65 "Sy sokong tanpa bangkang. Memang Anwar \"Calon PM\" terbaik. Dan dia sudah buktikan sel… Positive 
 5    58 "Peluncuran Tawaran Anak Muda Harapan oleh Angkatan Muda HARAPAN telah berlangsung pada … Neutral  
 6    63 "Rakyat pilih DSAI sbgai PM. Ayuh Malaysia pastikan calon PH menang di semua Parlimen. #… Positive 
 7    48 "Keep fit🔥🔥🔥\n\n#KitaBoleh \n#PRU15 \n#PakatanHarapan \n#P148AyerHitam https://t.co/g… Positive 
 8    50 "List of Perikatan Nasional GE15 candidates \nhttps://t.co/ngscrveeIm \n\n#theSun #thesu… Neutral  
 9    57 "Pas youth claims his party is full of intergrity compared to Barisan Nasional (BN) and … Positive 
10     8 "@IsmailSabri60 Thank You Sir for promoting #PakatanHarapan #Menang #PKR_MENANG \ndi Ber… Positive 
# ℹ 61 more rows
# ℹ Use `print(n = ...)` to see more rows

```



## Report a bug

To report a bug, please file an issue on [Github](https://github.com/zahiernasrudin/malaytextr/issues)

------------------------------------------------------------------------

MIT License

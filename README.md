# malaytextr
Bahasa Malaysia NLP Package for R

## Features
- Malayrootwords dictionary list
- Stemming words

## Installation

You can install the development version from GitHub with:

```r
# install.packages("devtools")
devtools::install_github("zahiernasrudin/malaytextr")
```

## Examples

There is a data frame of Malay root words that can be used as a dictionary:

```r

malayrootwords

# A tibble: 4,244 x 2
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
# ... with 4,234 more rows

```

Stem Malay words

`stem_malay()` will find the root words in a dictionary, in which the `malayrootwords` data frame can be used, then it will remove "extra suffix"", "prefix" and lastly "suffix"

To stem word "banyaknya". It will return a data frame with the word "banyaknya" and the stemmed word "banyak":

```r
stem_malay(Word = "banyaknya", dictionary = malayrootwords)

 Col Word root_word
1 banyaknya    banyak
```

To stem words in a data frame:
1. Specify the data frame
2. Specify the dictionary
3. Specify the column that needs to be stemmed


```r

x <- data.frame(x = c("banyaknya","sangat","terkedu", "pengetahuan"))

stem_malay(Word = x, 
          dictionary = malayrootwords, 
          col_feature1 = "text")
  
     Col Word root_word
1   banyaknya    banyak
2      sangat    sangat
3     terkedu      kedu
4 pengetahuan      tahu

```

## Report a bug

To report a bug, please file an issue on [Github](https://github.com/zahiernasrudin/malaytextr/issues)


-----

MIT License

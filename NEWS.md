# malaytextr 1.0.0

-   Added a `NEWS.md` file to track changes to the package.

1. Added more Malay root words:


```r

malayrootwords

# A tibble: 4,320 x 2
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
# ... with 4,310 more rows

```


2. To standardize the format, parameter `Word` will be changed to `word` (lowercase)
3. Returned properties `root_word` will be changed to `Root Word`

``` {r}
stem_malay(word = "banyaknya", dictionary = malayrootwords)
   Col Word Root Word
1 banyaknya    banyak
```

Another example:

```r

x <- data.frame(text = c("banyaknya","sangat","terkedu", "pengetahuan"))

stem_malay(word = x, 
          dictionary = malayrootwords, 
          col_feature1 = "text")
  
     Col Word Root Word
1   banyaknya    banyak
2      sangat    sangat
3     terkedu      kedu
4 pengetahuan      tahu

```

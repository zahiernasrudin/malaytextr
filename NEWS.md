# malaytextr 0.1.2

1. Added more Malay root words:

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


2. To standardize the format, parameter `Word` will be changed to `word` (lowercase)
3. Returned properties `root_word` will be changed to `Root Word`

``` r
stem_malay(word = "banyaknya", dictionary = malayrootwords)

'Root Word' is now returned instead of 'root_word'
   Col Word Root Word
1 banyaknya    banyak
```

Another example:

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

4. New Malay stop words data frame:

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

5. Sentiment words data frame:

``` r
sentiment_general
# A tibble: 1,424 × 2
   Word      Sentiment
   <chr>     <chr>    
 1 berjaya   Positive 
 2 baik      Positive 
 3 terkenal  Positive 
 4 membantu  Positive 
 5 mudah     Positive 
 6 popular   Positive 
 7 moden     Positive 
 8 memenangi Positive 
 9 bebas     Positive 
10 menarik   Positive 
# … with 1,414 more rows
```

6. Normalized words data frame:

``` r
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

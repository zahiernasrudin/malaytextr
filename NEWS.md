# malaytextr 0.1.3

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

2. Added more sentiment words:

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

3. Malaysia Politic Tweets Sentiment Dataset (Development Version)

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


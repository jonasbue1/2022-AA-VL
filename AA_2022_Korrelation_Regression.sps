* Encoding: UTF-8.

***VL4: Korrelation & bivariate Regression ***

***Studie: Johannes, N., Dienlin, T., Bakhshi, H. et al. No effect of different types of media on well-being 
    Sci Rep 12, 61 (2022). https://doi.org/10.1038/s41598-021-03218-7***
*** Daten: https://osf.io/f3qjv/ => wave1.csv ***

*** Fragestellung:
    1. In welchem Zusammenhang stehen Alter und Geschlecht mit der Nutzungszeit verschiedener Medien ***
    2. In welchem Zusammenhang stehen die Nutzungszeiten verschiedener Medien untereinander ***
    3. Welchen Effekt hat Alter auf die 
    
*** Deskriptive Analyse *** 

FREQUENCIES VARIABLES=gender.

DESCRIPTIVES VARIABLES= age music_time films_time tv_time games_time books_time 
    magazines_time audiobooks_time total_time
  /STATISTICS=MEAN STDDEV MIN MAX.

*** Korrelationen*** 

CORRELATIONS
  /VARIABLES=gender age music_time films_time tv_time games_time books_time magazines_time 
    audiobooks_time total_time
  /PRINT=TWOTAIL NOSIG LOWER.

*** Ergebnisse:  
    -     Geschlecht (dummy 1 = männlich, 2 = weiblich) steht in einem negativen Zusammenhang mit Musikzeit (r= -.08, p<.001), 
          Videospielzeit (r= -.125, .p<.001), einem positiven Zusammenhang mit Buchzeit (r = .066, p<.001) und einem negativen Zusammenhang mit der Gesamtzeit (r = -.60, p<.01)
    -     Das Alter steht in einem negativen Zusammenhang mit Musikzeit (r= -.22, p<.001), Filmzeit (r = -.17, p<.001), Fernsehzeit (r = -.10, p<.001),
          Videospielzeit (r= -.23, .p<.001), einem positiven Zusammenhang mit Buchzeit (r = .051, p<.05) und Gesamtzeit (r = -.25, p<.001).***
    -     Musikzeit steht in einem positiven Zusammenhang mit Filmzeit (r =.16,p<.001)
    -     Filmzeit steht in einem positiven Zusammenhang mit Fernsehzeit (r = .08, p<.001) 
    usw.***
    
*** Lineare Regression *** 

REGRESSION
  /DEPENDENT films_time
  /METHOD=ENTER age.

*** Das Alter hat einen positiven Einfluss auf Filmzeit (b = .17, p<.001). Mit jedem Jahr älter, steigt die Filmzeit um .17 Einheiten ***

REGRESSION
  /DEPENDENT games_time
  /METHOD=ENTER gender.

*** Geschlecht hat einen negativen Einfluss auf Videospielzeit (b = .-600, p<.001). Frauen verbringen im Durchschnitt 0.6 Einheiten weniger
    Zeit mit Videospielen als Männer ***

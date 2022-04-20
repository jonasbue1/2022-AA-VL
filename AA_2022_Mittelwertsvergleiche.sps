* Encoding: UTF-8.
***VL3: Mittelwertsvergleiche***

*** Beispielstudie: Kümpel, A.S. (2019). Getting Tagged, Getting Involved with News? 
    A Mixed-Methods Investigation of the Effects and Motives of News-Related Tagging Activities on Social Network Sites 
    Journal of Communication,69,4, 373–395. https://doi.org/10.1093/joc/jqz019 *** 
*** Zugrundeliegende Daten: https://osf.io/8td9w/ => Study 1 Tagging_Data.sav ***

*** Fragestellung: Unterscheidet sich die Rezeptionswahrscheinlich in sozialen Netzwerken anhand der Kurationsmodi (Post, Chronik, Tag, DM)?
***Variablen: UV: Kurationsmodus_SNS, AV: Rezeptionswahrscheinlichkeit***

*** Deskriptive Statistik *** 

*** Häufigkeiten UV *** 
FREQUENCIES VARIABLES=Kurationsmodus_SNS.

*** Beschreibung AV *** 

DESCRIPTIVES VARIABLES=Rezeptionswahrscheinlichkeit
  /STATISTICS=MEAN STDDEV VARIANCE MIN MAX.

*** Analyse der Unterschiede ***
*** Unterschiede zwischen zwei Ausprägungen => t-test mit unabhängigen Stichproben *** 

T-TEST GROUPS=Kurationsmodus_SNS('1' '2')
  /VARIABLES=Rezeptionswahrscheinlichkeit.

*** Ergebnis: Die Rezeptionswahrscheinlichkeit unterscheidet in den Kurationsmodi Chronik (M = 2.88, SD = 1.20) und Tag (M = 3.51, SD = 1.32) (t(291) = - 4.27, p<.001).***

*** Unterschiede zwischen mehr als zwei Ausprägungen der UV, nicht mit mehreren T-Test wegen Alpha-Fehler-Kumulation, sondern mit der Varianzanalyse***
*** Univariate Varianzanalyse, Posthoc-Test mit GT2-Hochberg Korrektur, Estimated Means ausgeben lassen***

UNIANOVA Rezeptionswahrscheinlichkeit BY Kurationsmodus_SNS
  /POSTHOC=Kurationsmodus_SNS(GT2) 
  /EMMEANS=TABLES(Kurationsmodus_SNS) COMPARE ADJ(LSD)
  /DESIGN=Kurationsmodus_SNS.

*** Die Rezeptionswahrscheinlichkeit unterscheidet sich innerhalb der Kurationsmodi (F(3,520) = 10.17, p<.001) *** 
    
*** Alternative Methode: Erstellung von Dummies, ANOVA oder auch Regression gemäß GLM ***
    
***Erstellung von Dummies *** 

SPSSINC CREATE DUMMIES VARIABLE=Kurationsmodus_SNS 
ROOTNAME1=Kurationsmodus 
/OPTIONS ORDER=A USEVALUELABELS=YES USEML=YES OMITFIRST=NO.


***Anova mit Dummies***

DATASET ACTIVATE DataSet1.
UNIANOVA Rezeptionswahrscheinlichkeit BY Kurationsmodus_1 Kurationsmodus_2 Kurationsmodus_3 
    Kurationsmodus_4
  /DESIGN=Kurationsmodus_1 Kurationsmodus_2 Kurationsmodus_3 Kurationsmodus_4.

*** Ergebnis ist das gleiche wie ANOVA, nur sind keine Post-hoc Tests möglich ***

*Lineare Regression*
    
REGRESSION
  /STATISTICS COEFF OUTS R ANOVA
  /DEPENDENT Rezeptionswahrscheinlichkeit
  /METHOD=ENTER Kurationsmodus_2 Kurationsmodus_3 Kurationsmodus_4.

*** Ergebnis auch das gleiche wie oben,. Ausgabe enthält Regressionskoeffizienten,
    vergleiche Regressionskoeffizienten mit Post-Hoc Tests des ersten Kurationsmodus "Post" (Interzept in der Regression) in ANOVA*** 



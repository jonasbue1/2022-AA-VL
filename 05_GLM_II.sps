* Encoding: UTF-8.

***VL5: GLM II***


*** Beispielstudie: Kuempel, A.S. (2019). Getting Tagged, Getting Involved with News? 
    A Mixed-Methods Investigation of the Effects and Motives of News-Related Tagging Activities on Social Network Sites 
    Journal of Communication,69,4. https://doi.org/10.1093/joc/jqz019 *** 
*** Zugrundeliegende Daten: https://osf.io/8td9w/ => Study 1 Tagging_Data.sav ***

* Fragestellung: Unterscheidet sich die Rezeptionswahrscheinlich in sozialen Netzwerken anhand der Kurationsmodi (Post, Chronik, Tag, DM)?
    
*** Erstellung Dummy ***
 
SPSSINC CREATE DUMMIES VARIABLE=Kurationsmodus_SNS 
ROOTNAME1=Modus 
/OPTIONS ORDER=A USEVALUELABELS=YES USEML=YES OMITFIRST=NO.

RENAME VARIABLES (Modus_1 Modus_2 Modus_3 Modus_4 = Modus_Post Modus_Chronik Modus_Tag Modus_DM).


*Variablen: UV: Modus_tag AV: Rezeptionswahrscheinlichkeit*

REGRESSION
  /DEPENDENT Rezeptionswahrscheinlichkeit
  /METHOD=ENTER Modus_Tag.

*** Variablen UV: Modi, AV: Rezeptionswahrscheinlichkeit ***

REGRESSION
  /DEPENDENT Rezeptionswahrscheinlichkeit
  /Method=Enter Modus_Chronik Modus_Tag Modus_DM.

*** Alternativ ***
    
UNIANOVA Rezeptionswahrscheinlichkeit BY Kurationsmodus_SNS
  /DESIGN=Kurationsmodus_SNS.


*** Bonus **

RECODE species (CONVERT) INTO species_new.

regression 
    /DEPENDENT total_cup_points
    /Method=Enter species.
    


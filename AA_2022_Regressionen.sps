* Encoding: UTF-8.
*** VL 5: Regressionen ***
    
*** Studie: van Erkel,  P. F. A .& Van Aelst, P. (2021) Why Don’t We Learn from Social Media? Studying Effects of and Mechanisms behind Social Media News Use on General Surveillance Political Knowledge, 
    Political Communication, 38:4, 407-425, DOI: 10.1080/10584609.2020.178432***
*** Daten: https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/D0COF1***


*** Fragestellungen:
    1. Welchen Einfluss hat die Nutzung verschiedener Nachrichtenkanäle auf den Eindruck sich in einer personalisierten Nachrichtenumgebung zu befinden?
    2.. Welchen Einfluss hat die Nutzung verschiedener Nachrichtenkanäle auf das Gefühl von zu vielen Informationen überfordert zu sein?
    
*** Deskripitive Statistik ***

*** Häufigkeiten *** 

FREQUENCIES VARIABLES=Gender Education
  /ORDER=ANALYSIS.

*** Deskripitive***

DESCRIPTIVES VARIABLES=Age News_channels_w4_1 News_channels_w4_2 News_channels_w4_3 
    News_channels_w4_4 News_channels_w4_5 News_channels_w4_6 Information_overload personalized_news 
    Political_interest.

*** Bildung für Regression als Dummy-Variable codieren *** 

SPSSINC CREATE DUMMIES VARIABLE=Education 
ROOTNAME1=Education 
/OPTIONS ORDER=A USEVALUELABELS=YES USEML=YES OMITFIRST=NO.

*** Regression 1 ***

REGRESSION
  /DEPENDENT personalized_news
  /METHOD=ENTER Gender Age News_channels_w4_1 News_channels_w4_2 News_channels_w4_3 
    News_channels_w4_4 News_channels_w4_5 News_channels_w4_6 Education_2 Education_3.

*** Das Modell ist signifikant F(10,768) = 5.45 und erklärt 5.4 % (r2 adj. = .054) der Varianz des Eindrucks einer personalisierten Nachrichtenumgebung (PNU),
    Alter hat einen signifikanten Effekt auf den Eindruck einer personalisierten Nachrichtenumgebung (b = -.01, p<.05). Mit jedem Jahr älter, sinkt das Gefühl
    sich in einer PNU zu befinden, um .01 Einheiten,
    Die Frequenz der Facebook-Nutzung hat einen signifikanten Effektn auf den Eindruck sich in einer PNU zu befinden (b = -.22, p<.001). Steigt die Facebook-Nutzung
    um eine eine Einheit, sinkt das Gefühl in einer PNU zu sein um .22 Einheiten. ***


*** Regression 2 ***

REGRESSION
  /DEPENDENT Information_overload
  /METHOD=ENTER Gender Age News_channels_w4_1 News_channels_w4_2 News_channels_w4_3 
    News_channels_w4_4 News_channels_w4_5 News_channels_w4_6 Education_2 Education_3 Political_interest.    

*** Das Modell ist signifikant F(11,981) = 3.39 und erklärt 2.6 % (r2 adj. = .026) der Varianz des Eindrucks einer personalisierten Nachrichtenumgebung (PNU),
    Das Geschlecht (1 = weiblich) hat einen signifikanten Effekt auf Information Overload  (b = .55, p<.01). Frauen nehmen einen .55 Einheiten höheren Information
    Overload wahr
    Alter hat einen signifikanten Effekt auf den Eindruck einer personalisierten Nachrichtenumgebung (b = -.02, p<.01). Mit jedem Jahr älter, steigt Information Overload
    um .23 Einheiten,
    Die Frequenz der Twitter-Nutzung hat einen signifikanten Effekt auf den Eindruck sich in einer PNU zu befinden (b = .23, p<.05). Steigt die Twitter-Nutzung
    um eine eine Einheit, steigt Information Overload um .23 Einheiten,
    Die Frequenz der Facebook-Nutzung hat einen signifikanten Effekt auf den Eindruck sich in einer PNU zu befinden (b = .16, p<.05). Steigt die Facebook-Nutzung
    um eine eine Einheit, steigt Information Overload um .16 Einheiten. ***

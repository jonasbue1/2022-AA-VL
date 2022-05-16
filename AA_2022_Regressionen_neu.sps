* Encoding: UTF-8.
***VL5: Regression und Korrelationen ***


*** Beispielstudie: Kuempel, A.S. (2019). Getting Tagged, Getting Involved with News? 
    A Mixed-Methods Investigation of the Effects and Motives of News-Related Tagging Activities on Social Network Sites 
    Journal of Communication,69,4. https://doi.org/10.1093/joc/jqz019 *** 
*** Zugrundeliegende Daten: https://osf.io/8td9w/ => Study 1 Tagging_Data.sav ***

* Fragestellung: Welchen Einfluss haben Kurationsvarianten in SNS auf die Rezeptionswahrscheinlichkeit?
    
* Nullmodell *
    
GENLIN Rezeptionswahrscheinlichkeit
  /SAVE MEANPRED RESID.

* Der MW liegt bei 3.04 *

*** Erstellen eines hierarchischen Modells ***
    Modell 1: Nur Tagging als Dummy
    Modell 2: Alle Dummies 
    
REGRESSION
  /DEPENDENT Rezeptionswahrscheinlichkeit
  /METHOD=ENTER Modus_Tag
  /METHOD=ENTER Modus_Chronik Modus_DM.

*** Ergebnis: 
    Das Modell 1 erklaert einen signifikanten Anteil der Varianz (F(1,522) = 30.35, p<.001) 5 % (r2 adj. = .05). Wenn ein Beitrag getaggt wird,
    steigt die Rezeptionswahrscheinlichkeit um .67 (b= .67, p<.001),
    Das Modell 2 erklaert nicht mehr Varianz als Modell 1 (r2 adj. = .05). Weder Chronik (b = .86, p=.61) noch DM (b = .04, p=.80) haben einen signifikanten Einfluss. 
    *** Wenn Sie sich das r2 adj. von Modell 2 anschauen, sehen Sie, dass es aufgrund der Strafe der Anpassung sogar noch geringer ist.***



* Encoding: UTF-8.
*** VL 2 GLM ***

*** Studie:Auty, S. and Lewis, C. (2004), Exploring children's choice: The reminder effect of product placement.***
    *Psychology & Marketing, 21: 697-713. https://doi.org/10.1002/mar.20025*
    
*** Fragestellung: Hängt die Präferenz für Cola oder Pepsi damit zusammen, ob Personen einen Film mit Produktplatzierung von Pepsi gesehen haben? ***

*** Deskriptive Analyse - Häufigkeiten ***

FREQUENCIES Film_PP Präferenz.

*** Für die Analyse lassen sich verschiedene Variationen des GLMs verwenden, die alle eine gemeinsame Logik haben ***

*** Zusammenhangshypothese: H1: Präferenz hängt mit Placement zusammen ***

*** Chi-2 ***
 
CROSSTABS
  /TABLES=Film_PP BY Präferenz
  /STATISTICS=CHISQ.

*** Ergebnis: Die Präferenz hängt damit zusammmen, ob man ein Produktplacement gesehen hat (chi2 = 4.14, p<.05) ***
    
*** ANOVA und Regression ***

UNIANOVA Präferenz BY Film_PP
  /DESIGN=Film_PP.

*** Ergebnis: Produkt-Placement hat einen signifikanten Einfluss (Haupteffekt) (F = 4.23, p<.05) auf Präferenz und erklärt 3% (r2 adj. = .03) der
    Varianz ***
*** Bei dem Anova Befehl erhält man nicht automatisch eine Parameterschätzung. Diese kann man unter Optionen hinzufügen *** 

REGRESSION
  /DEPENDENT Präferenz
  /METHOD=ENTER Film_PP.

*** Ergebnis: Produkt-Placement hat einen signifikanten Einfluss (Haupteffekt) (F = 4.23, p<.05) auf Präferenz,
     und erklärt 3% (r2 adj. = .03) der Varianz. genau gleich wie ANOVA. Nur erhalten wir hir noch eine Parameterschätzung "inklusive".***
*** Wenn Leute ein Placements sahen, stieg ihre Präferenz für Pepsi um .2 (b = .20, p<.05). ***

*** Unterschiedshypothese (das Gegenteil der ersten Hypothese): H1: Präferenz unterscheidet sich danach, ob man ein Placement gesehen hat ***

*** T-Test ***

T-TEST GROUPS=Film_PP(0 1)
  /VARIABLES=Präferenz.

*** Ergebnis: Die Präferenz unterscheidet sich signifikant (T= -2.06, p<.05) zwischen Leuten, die ein Placement (M = .43, SD = .50) und kein Placement
    (M = .63, SD = .49) sahen. ***


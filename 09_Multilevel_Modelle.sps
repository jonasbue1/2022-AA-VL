* Encoding: UTF-8.
*** VL 09: Multilevel Modelle ***
    
*** Beispielstudie:  Fähnrich, B., Vogelgesang, J. & Scharkow, M. (2020), "Evaluating universities' strategic online communication: how do Shanghai Ranking's top 50 universities grow stakeholder engagement with Facebook posts?", 
    Journal of Communication Management, Vol. 24 No. 3, pp. 265-283. https://doi.org/10.1108/JCOM-06-2019-0090***
 
*** Nullmodell und ICC ***

mixed comments_count
 /print = solution DESCRIPTIVES
 /random = intercept  | subject(uni)
 /EMMEANS=TABLES(OVERALL).

*ICC geht leider nicht automatisch: Between-Varianz / Totale Varianz = 279 / (279 + 1109) = .201 ***
*** 20% der Varianz wird zwischen den Gruppen erklärt ***

*** Falsches lineares Modell ***
 
mixed comments_count with topic_interact
 /print = solution 
 /random = intercept topic_interact
 /EMMEANS=TABLES(OVERALL).

*** Richtiges Modell mit variablen Intercepts ***

mixed comments_count with topic_interact
 /print = solution G
 /fixed = topic_interact
 /random = intercept | subject(uni).

*** Modell mit Level-2-Prädiktor ***

mixed comments_count with topic_interact uni_fans
 /print = solution G
 /fixed = topic_interact uni_fans
 /random = intercept | subject(uni).



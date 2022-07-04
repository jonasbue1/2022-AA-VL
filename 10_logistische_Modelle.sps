* Encoding: UTF-8.
*** VL 10: Logistische Modelle***

*** Beispielstudie: Festl, R., Scharkow, M. & Quandt, T. (2013) Peer Influence, Internet use and Cyberbullying: A Comparison of Different Context Effects among German Adolescents, 
    Journal of Children and Media, 7:4, 446-462, DOI: 10.1080/17482798.2013.781514***
    
*** Kreuztabellen und Chi-Quadrat***
    
CROSSTABS
  /TABLES=cbvictim_gen BY gender
  /STATISTICS=CHISQ 
  /COUNT ROUND CELL.

*** Bivariate logistische Regression ***

LOGISTIC REGRESSION VARIABLES cbvictim_gen with gender.
  /METHOD=ENTER gender 
  /SAVE=PRED
  /CRITERIA=PIN(.05) POUT(.10) ITERATE(20) CUT(.5).

* Diagrammerstellung.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=gender PRE_1 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE
  /FITLINE TOTAL=NO SUBGROUP=NO.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: gender=col(source(s), name("gender"), unit.category())
  DATA: PRE_1=col(source(s), name("PRE_1"))
  GUIDE: axis(dim(1), label("gender"))
  GUIDE: axis(dim(2), label("Vorhergesagte Wahrscheinlichkeit"))
  GUIDE: text.title(label("Streudiagramm von Vorhergesagte Wahrscheinlichkeit Schritt: gender"))
  SCALE: cat(dim(1), include("1", "2"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: point(position(gender*PRE_1))
END GPL.

aggregate outfile * mode addvariables
/mean_age = mean(age)
/mean_internetuse = mean(internetuse).

compute age_c = age - mean_age.
compute internetuse_c = internetuse - mean_internetuse.

recode gender (2 = 1) (1 = 0).

*Generalized Linear Mixed Models. 
GENLINMIXED
  /DATA_STRUCTURE SUBJECTS=class
  /FIELDS TARGET=cbvictim_gen TRIALS=NONE OFFSET=NONE
  /TARGET_OPTIONS DISTRIBUTION=BINOMIAL LINK=LOGIT
  /FIXED  EFFECTS=age_c internetuse_c gender gender*age_c USE_INTERCEPT=TRUE
  /RANDOM USE_INTERCEPT=TRUE SUBJECTS=class COVARIANCE_TYPE=VARIANCE_COMPONENTS SOLUTION=FALSE 
  /EMMEANS_OPTIONS SCALE=ORIGINAL PADJUST=LSD.





***The effect of long-term development and schooling expansion on homicide decline: The case of Mexico (1950 to 2005)"

*** Replication File ***

use "C:\Users\xxx\DecadesCrimeRatesMexico.dta", clear

** Declare panel **

xtset entidad year
 
****** Key of variables ********

*** All data is for this periods 1950 - 60 - 70 - 80 - 90 - 00 - 05 
*** 32 Mexican States 

* rate Homicide rates per state for decades 1950 to 2005 (Piccato, Hidalgo & Lajous 2017)

* escolaridad schooling rates in Mexican Censuses (INEGI)

* gdp GDP Per Capita (Carrion-I-Silvestre & German-Soto, 2007)

* logland Logaritm of land distributed in the National Agrarian Registry (RAN) (Albertus, 	et. al. 2016) 

* urban Percentage of urban population in Mexican Censuses (INEGI)

* youth Percentage of youth population share (under 29 years) 

* employment Percentage of available population employed in Mexican Censuses (INEGI) 

* hab Mean of inhabitants per household in Mexican Censuses (INEGI) 

* robbery Robbery rates (Piccato, Hidalgo & Lajous 2017)

* injuries Injuries crime rates (Piccato, Hidalgo & Lajous 2017)

* federaldrug Federal crime rates (Piccato, Hidalgo & Lajous 2017)

* smuggling Smuggling crime rates (Piccato, Hidalgo & Lajous 2017)

* propetydamage Propety damage crime rates (Piccato, Hidalgo & Lajous 2017)

* party Party of the governor of the state. PRI is 1, Non PRI is 0, part of the term different parties is 0.5

* civilunion Percentage of population married in Mexican Censuses (INEGI) 

*** Basic statistics of the variables ***

summarize
corr rate escolaridad gdp urban youth employment robbery injuries propetydamage hab party civilunion logland

** test for collinearity ** 

corr rate escolaridad gdp urban youth employment robbery injuries propetydamage hab party civilunion

graph matrix rate escolaridad gdp urban
regress rate escolaridad gdp urban youth employment robbery injuries propetydamage hab party civilunion logland
vif

graph matrix rate escolaridad gdp
corr rate escolaridad gdp youth employment robbery injuries propetydamage hab party civilunion
regress rate escolaridad gdp youth employment robbery injuries propetydamage hab party civilunion logland
vif

graph matrix rate escolaridad gdp
corr rate escolaridad gdp youth employment robbery injuries propetydamage hab civilunion
regress rate escolaridad gdp youth employment robbery injuries propetydamage hab civilunion logland party
vif

graph matrix rate escolaridad gdp
corr rate escolaridad gdp youth employment robbery injuries propetydamage hab party civilunion
regress rate escolaridad youth employment robbery injuries propetydamage hab civilunion logland party 
vif


*** graphs *** 

xtline rate, recast(bar) barwidth(4)
xtline employment, recast(bar) barwidth(4)
xtline gdp, recast(bar) barwidth(4)
xtline urban, recast(bar) barwidth(4)
xtline escolaridad, recast(bar) barwidth(4)
xtline propetydamage, recast(bar) barwidth(4)
xtline robbery, recast(bar) barwidth(4)
xtline civilunion, recast(bar) barwidth(4)

twoway (scatter employment year , msymbol(smcircle))
twoway (scatter escolaridad year , msymbol(smcircle))
twoway (scatter gdp year , msymbol(smcircle))
twoway (scatter robbery year , msymbol(smcircle))

** Homicide rates graphs ** 

graph use "C:\Users\xxx\homicidehistoric.gph"


** Vibarate regressions ***

twoway (scatter rate escolaridad, msymbol(smcircle))
twoway (scatter rate employment, msymbol(smcircle))
twoway (scatter rate youth, msymbol(smcircle))
twoway (scatter rate gdp, msymbol(smcircle))
twoway (scatter rate propetydamage , msymbol(smcircle))

 regress rate escolaridad
 avplots, msymbol(smtriangle) rlopts(lcolor(gold))
  regress rate employment
 avplots, msymbol(smtriangle) rlopts(lcolor(gold))
  regress rate youth
 avplots, msymbol(smtriangle) rlopts(lcolor(gold))
  regress rate loggdp
   avplots, msymbol(smtriangle) rlopts(lcolor(gold))
  regress rate propetydamage
 avplots, msymbol(smtriangle) rlopts(lcolor(gold))
 
*** models ***

 xtset entidad decade 


*GLS regression with AR(1) disturbances*

**fixed effects**
xtregar rate escolaridad gdp urban youth employment robbery injuries propetydamage hab party civilunion, fe rhotype(theil)

**random effects**
xtregar rate escolaridad gdp urban youth employment robbery injuries propetydamage hab party civilunion, re rhotype(theil)

*Prais-Winsten regression, correlated panels corrected standard errors (PCSEs)*

xtpcse rate escolaridad gdp urban youth employment robbery injuries propetydamage hab party civilunion, correlation(psar1) rhotype(tscorr) 

*with logland* 
xtpcse rate escolaridad gdp urban youth employment robbery injuries propetydamage hab party civilunion logland, correlation(psar1) rhotype(tscorr)

*without logland and crime rates* 
xtpcse rate escolaridad gdp urban youth employment hab party civilunion , correlation(psar1) rhotype(tscorr)

xtpcse rate escolaridad gdp youth employment hab party civilunion robbery injuries propetydamage, correlation(psar1) rhotype(tscorr)

xtpcse rate escolaridad youth employment hab party civilunion, correlation(psar1) rhotype(tscorr)


xtpcse rate escolaridad youth employment hab party civilunion , correlation(psar1) rhotype(tscorr)

xtpcse rate gdp youth employment hab party civilunion , correlation(psar1) rhotype(tscorr)

xtpcse rate urban youth employment hab party civilunion , correlation(psar1) rhotype(tscorr)

xtpcse rate escolaridad gdp youth employment hab party civilunion , correlation(psar1) rhotype(tscorr)



xtregar rate escolaridad youth employment robbery injuries propetydamage hab party civilunion, fe rhotype(theil)
xtregar rate escolaridad youth employment robbery injuries propetydamage hab party civilunion, re rhotype(theil)

 





 
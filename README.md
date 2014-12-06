# Analiza podatkov s programom R, 2014/15

Avtor: Filip Lenarčič

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

V mojem projektu bom analiziral statistiko klubov severno-ameriške hokejske lige NHL.  Primerjal bom število strelov, ki jih je imela določena ekipa v odvisnosti od števila zadetkov in tako ugotovil katera ekipa je najučinkovitejša v napadu ter tudi v obrambi. Prav tako bom analiziral igralce ekipe Chicago Blackhawks ter jih razvrstil v kategorije na podlagi tega ali je strelec vrhunski, dober, povprečen ali slab (urejenostna spremenljivka).  Učinkovitost igralcev ekipe Chicaga bom ugotovil na podlagi golov, asistenc in točk, ki jih je določen igralec dosegel v odvisnosti od števila odigranih tekem. V analizo bom vklučil tudi pozicijo na kateri igralci igrajo in na podlagi določene skupine igralcev razvrščene glede na pozicijo analiziral uspešnost njihove igre skozi sezono.

Cilj projekta je s programom RStudio analizirati podatke klubov in igralcev severno-ameriške hokejske lige NHL ter spoznati osnovne veščine programiranja v R-u. Podatke za moj projekt bom dobil na spletni strani NHL-ja (http://www.nhl.com/ice/teamstats.htm).


## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.

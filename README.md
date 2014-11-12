# Analiza podatkov s programom R, 2014/15

Avtor: Filip Lenarčič

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

V mojem projektu bom analiziral poslovanje podjetij kot del posameznih gospodarskih enot. Podjetja v posameznih dejavnostih bom razvrstil po velikosti glede na število zaposlenih in na obseg prihodkov od prodaje, pri tem pa bom analiziral število teh podjetij po dejavnosti, prihodku od prodaje, številu zaposlenih, nabavi blaga in storitev, ter ugotavljal v katerih dejavnostih omenjeni ekonomski kazalci prevladujejo.

Analiziral bom tudi osnovne kazalce demografije podjetij po kohezijskih in statističnih regijah. Pri tem bom upošteval podjetja s sedežem na vzhodu ali zahodu Slovenije ter primerjal število le teh, število novonastalih podjetij in njihovo povprečno velikost ter število podjetij, ki so nehala poslovati. Po potrebi bodo v primerjavo vklučena tudi podjetja največjih slovenskih mest.
Analiziral bom tudi hitrorastoča podjetja, gazele ter srednjerastoča podjetja ter njihovo število v posameznih regijah glede na prihodek. 

Analiza bo torej pokazala, v katerih regijah je največ podjetij oziroma novonastalih podjetih, v katerih največ podjetij s prenehanjem poslovanja ter v katerih dejavnostih poslujejo podjetja z največjimi prihodki od prodaje.  
 
Cilj projekta je s programom RStudio analizirati podatke iz poslovanja slovenskih podjetij ter spoznati osnovne veščine programiranja v R-u. 

Podatke za moj projekt bom dobil iz spletne strani Statističnega urada Republike Slovenije. http://pxweb.stat.si/pxweb/Database/Ekonomsko/Ekonomsko.asp 

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

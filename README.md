# Introduction

## Données

  Nous avons choisi d’utiliser un dataset portant sur la **prédiction des résultats finaux de lycéens de deux établissements portugais** :  Paolo Cortez et  Minho.
Les résultats visibles dans le dataset concernent les **mathématiques** et le **portugais** et ce dernier a été conçu de telle sorte qu’on puisse connaître le niveau (la note) de chaque élève dans les deux matières. <br>
  Notre dataset contient **33 variables** et **395 observations**. Parmi les variables, on dénote 13 de type numériques, 12 catégorielles et 8 booléennes. Nous disposons donc à priori d’assez de données pour avoir un **résultat significatif**. <br>
  De façon générale, les variables nous donnent des informations sur **l’environnement socio-culturel** de l’élève à travers le milieu dans lequel il réside, **les activités** auxquelles il a accès et **le background académique** dont dispose ses parents. Nous retrouvons aussi des données relatives à **la charge de travail** de ces derniers ainsi que de **leur état de santé**. <br>
  Toutes ces informations nous permettent de basculer sur la deuxième partie de cette présentation du jeu de données : **le plan d’analyse**.

## Plan d’analyse

Nous prévoyons de mener des études sur **les facteurs qui influenceraient de bons ou moins bons résultats** chez les élèves. Il pourra être intéressant de travailler sur différents aspects : le **social**, l’**économie**, mais aussi les critères **relatifs à l’élève** d’un point de vue personnel.
**Evaluer les corrélations** et essayer de **trouver du sens à ces chiffres** est l’objectif que nous essayerons d’atteindre durant ce projet.

Ainsi, nous pouvons regrouper de cette façon, les différentes questions que nous allons nous poser et essayer de répondre en analysant le jeu de données.

### Influence du sexe
 Un des premiers axes de recherche va être de voir si le sexe a une influence sur les notes des élèves. Nous allons notamment vérifier si le préjugé suivant est vrai : **les filles ont de meilleurs résultats que les garçons.**
<hr>

### Influence du cadre de vie
#### Lieu de vie
  On se demandera par exemple si le lieu où vivent les étudiants (ville ou campagne), influe directement sur leurs notes ? On pourra notamment s'appuyer sur le temps de trajet (les personnes de milieu rural ont sûrement plus de trajet), l'accès à internet, le nombre d'absences... Bien que la campagne présente un endroit plus grand et plus calme pour travailler, on va essayer de voir si **la distance et a un impact sur les résultats aux examens**.

#### Cadre familial
  Avec les données fournies, nous pourrons également anaylser le cadre familial. De ce fait nous allons nous pencher sur l'éducation des parents ; et donc voir si l'éducation des parents, leur métier, leur état matrimonial et/ou le nombre d'enfants dans la famille, ont un lien direct avec les notes. <br>
  Nous allons donc pouvoir nous nous pencher sur le nombre d'enfants dans la famille, le statut marital des parents, le niveau d'étude des parents et leur métier. Par exemple, **est-ce qu'un enfant dont les parents sont professeurs a forcément des bonnes notes ?**

#### Consommation d’alcool
  Un des gros aspects de notre dataset concerne la consommation d’alcool. En effet, on pourra regarder si la consommation d’alcool en semaine et/ou le weekend fait baisser les notes des élèves. On pourra de ce fait regarder le pourcentage d’étudiants qui réussissent en comparaison avec la consommation d’alcool. **Est-ce que les personnes qui boivent beaucoup réussissent moins que celles qui boivent peu ?** <br>
  On pourra aussi se demander si la consommation d’alcool entraîne un nombre d’absences plus élevé ? De plus, nous avons accès aux potentiels problèmes de santé. On pourra regarder si la grande consommation d’alcool implique généralement des problèmes de santé, et on pourra essayer de voir **si les problèmes de santé impliquent la non-réussite des examens ?**

#### Vie sentimentale
 On pourra s’intéresser aux relations amoureuses des étudiants en se demandant si les relations amoureuses ont des impacts sur notes des élèves. On pourra en déduire si **l'amour est-il un frein aux études.**
<hr>

### Influence activités extra-scolaire
Le jeu de données informe sur la pratique de sport des élèves, ainsi que leurs sorties entre amis. Ces 2 activtiés permettent de se défouler hors des cours, de se vider la tête et de penser à autre chose. Nous allons donc se demander **si le sport et/ou les sorties en amis ont un bon impact sur les notes des élèves.**
<hr>

### Influence de l’implication scolaire
#### Temps de travail
Nous avons accès au temps de travail des élèves. Nous allons pouvoir vérifier **si le fait de travailler beaucoup implique-t-il forcément de meilleurs résultats.**

#### Volonté de faire des grandes études
Comme il est également indiqué si les élèves veulent faire de longues études, on se demandera **si ceux-ci sont en général plus impliqués et ont donc de meilleures notes ?**

#### Cours privés
Certians élèves suivent des cours privés, nous allons essayer de voir **si le fait d’avoir des cours privés permet-il de mieux réussir ?**
<hr>

### Comparaison des écoles
#### Age/sexe
Le jeux de données se base sur des étudiants de 2 écoles différentes. On pourra donc comparer par âge, et/ou par sexe **si les élèves de l’école Gabriel Pereira réussissent-ils mieux que ceux de Mousinho Da Silveira.** 

#### Choix des écoles
En se rapportant au cadre famillial, nous nous demanderons s'il y a une influence sociale dans les écoles ? En soit, **si les élèves avec des parents ayant reçu une bonne éducation scolaire et/ou avec un bon métier ont-ils plus tendance à aller à GP ou à MDS ?**

Nous pourrons également nous interesser aux raisons qui ont poussés les étudiants à choisir une école et voir **si une école attire beaucoup d'élèves pour une même raison.**. Nous pourrons voir **si les ambitions d'études influent sur le choix des études.** Et à la fin, nous pourrions essayer de voir **s'il y a un lien entre la raison de chosir une école et les ambitions d'études.**
<hr>

### Etude comparative sur les matières
En considérant tous les axes d’études présentés précédemment, il sera aussi envisageable d’identifier quels facteurs contribuent à la réussite en mathématiques ou en portuguais. **Est-ce que le métier des parents donnerait-il plus ou moins de chances à un élève de réussir dans l’une ou l’autre des matières?** Quels pourraient être les facteurs qui expliqueraient qu’un même élève réussisse mieux dans une matière que dans l’autre? (sexe, ambition dans les études, le choix de l'école...).
<hr>

**CONCLUSION** <br>
Ces questions nous permettront donc de se faire une idée du « combo » parfait pour la réussite d’un étudiant. On aura donc accès à suffisamment d’informations pour définir un profil type de l’élève qui réussit dans ces établissements.


## Liens et références

Site permettant d’obtenir le dataset : https://www.kaggle.com/dipam7/student-grade-prediction <br>
Etude sur le jeu de données : http://www3.dsi.uminho.pt/pcortez/student.pdf

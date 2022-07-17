* Utilisation *

** Pour compiler ** 

Taper 'make' dans un terminal, positionné à la racine du répertoire 

Pour tester, taper dans un terminal à la racine du répertoire :

./bin/cpp/test_decoupage_fonction ./src/examples/mat_mul.s
./bin/cpp/test_decoupage_fonction ./src/examples/max_fcts.s
./bin/cpp/test_decoupage_fonction ./src/examples/tab_fcts.s
./bin/cpp/test_decoupage_fonction ./src/examples/aes_ca.s

** Pour générer la documentation **

Taper dans un terminal à la racine du répertoire 'doxygen doxyconfig'

ouvrir le fichier 

$PATH_TO_HERE/doc/html/index.html dans un navigateur

où $PATH_TO_HERE vaut le résultat de 'pwd' tapé à la racine du répétoire dans un terminal 

* Structure du code *


** Dans ce répertoire **

Makefile 

bin/ contient les executables après compilation
doc/ contient la documentation après sa génération
include/ contient les fichiers d'entête
lib/ contiet après compilation la bibliothèque de parsing et manipulation de code assembleur
obj/ contient les fichiers objet après compilation 
src/  contient les fichiers sources 
tmp/ contient les fichiers .dot générés à l'exécution



*** répertoire src *** 

src/  contient les fichiers sources  .cpp et .c et est organisé comme suit 

src/base/ contient les .cpp des classes
src/mains/ contient les programmes principaux + README.txt pour leur description, il y a un programme par étape du TP 
src/parsing/ contient le code pour le parseur des fichiers assembleurs mips
src/example/ contient des fichiers examples de code assembleur mips (notamment ceux utilisés en TD)


*** repertoire include *** 
 
include/ contient les fichiers d'entête, il contient notamment Enum_type.h avec tous les types énumérés. Attention certains fichiers .h contiennent du code, donc en cas de modifications il faut recompiler.

*** répertoire doc *** 
doc/latex contient la documentation latex une fois générée (il faut compiler latex avant de pouvoir visualiser !)
doc/html contient la documentation en html une fois générée ; le fichier index.html est le point d'entrée de la documentation

*** répertoire tmp ***

Les programmes mis à disposition génèrent parfois des fichiers .dot pour représenter des graphes (CFG et DAG).
On peut générer un fichier pdf à partir d'un fichier .dot avec la commande :

dot -Tpdf -o fichier.pdf fichier.dot

NB: makePdf est script (dans le répertoire racine) permettant de générer un pdf pour chaque fichier .dot du répertoire où il est appelé. 

#!/bin/bash

for i in $(ls *.dot)
do
    dot -Tpdf $i  > ${i%.dot}.pdf 
done

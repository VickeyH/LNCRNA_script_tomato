#!/bin/bash
awk '$0!~"="&&$3=="transcript"{print $0}' merged.annotated.gtf |awk '$0!~"j"&&$5-$4>=200{print $0}'>step1_script.gtf

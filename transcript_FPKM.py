# -*- coding: utf-8 -*-
#!/bin/python
"""
Created on Sun Apr 22 14:39:38 2018

@author: woshicong
"""
from sys import argv

old_gtf = argv[1]
new_gtf = argv[2]
trans = argv[3]
Transcript_ID = [ ]
with open (trans) as Lnc :
    for i in Lnc:
        Transcript_ID.append(i.strip())
#print (Lnc_ID)
with open (new_gtf,"w") as f:
    with open (old_gtf) as All:
        for p in All:
                if p[0:1] != "#":
                    ID=p.split()[11].split('"')[1]
                        #print(ID[1])
                    if ID  in Transcript_ID:
                        f.write(p)

# -*- coding: utf-8 -*-
#!/bin/python
"""
Created on Sun Apr 22 14:39:38 2018

@author: woshicong
"""
Lnc_ID = [ ]
with open ("fina_lnc_ID.out") as Lnc :
    for i in Lnc:
        Lnc_ID.append(i.strip())
#print (Lnc_ID)
with open ("Lnc_RNA.count","w") as f:        
    with open ("all.count") as All:
        for p in All:
            ID=p.split()[0]
            if ID  in Lnc_ID:
                f.write(p)           

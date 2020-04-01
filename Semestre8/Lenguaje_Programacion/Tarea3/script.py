#! /bin/python3
import os
listfile = os.listdir(".")

for fil in listfile:
    new = "n"+fil
    os.system("cat "+fil+" > n"+fil)
    os.system("rm "+fil)
    os.system("mv "+new+" "+fil)

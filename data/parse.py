#!/usr/bin/env python
import lxml.etree as ET
import sys

if len(sys.argv) != 4:
    print("Usage: %s inputfile.xml transformation.xsl outputfile" % sys.argv[0])
    sys.exit(1)

dom = ET.parse(sys.argv[1])
xslt = ET.parse(sys.argv[2])
transform = ET.XSLT(xslt)
newdom = transform(dom)
html=str(newdom)

with open (sys.argv[3], 'w') as out_file:
    print(html, file=out_file) 

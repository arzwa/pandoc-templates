#!/bin/sh
# Wrapper script around pandoc / markdown2pdf
# Provides templates to apply with pdf processing
# Copyright Claes Holmerson 2010, GPL licensed (see COPYING for details)

#Find this directory
template_home=$(dirname $(readlink -f $0))

paper=a4paper
hmargin=3cm
vmargin=3.5cm
fontsize=10pt
#fontsize=11pt
#fontsize=12pt

#mainfont=Cambria
#sansfont=Corbel
#monofont=Consolas
mainfont=Georgia
sansfont=Verdana
monofont="monospace"
language=english
#language=swedish
nohyphenation=false

columns=onecolumn
#columns=twocolumn

geometry=portrait
#geometry=landscape

#alignment=flushleft
#alignment=flushright
#alignment=center

pandoc --latex-engine=xelatex --template=$template_home/xetex.template \
-V language=$language -V paper=$paper -V hmargin=$hmargin -V vmargin=$vmargin \
-V mainfont="$mainfont" -V sansfont="$sansfont" -V monofont="$monofont" \
-V geometry=$geometry -V alignment=$alignment -V columns=$columns \
-V fontsize=$fontsize -V nohyphenation=$nohyphenation \
-V toc=$toc \
$@

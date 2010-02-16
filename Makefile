##=============================================================================
## Makefile
##=============================================================================
## Copyright (c) 2008-2010 Thomas Weibel, <thom@beeblebrox.net>
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
##=============================================================================


##-----------------------------------------------------------------------------
## Embedded documentation
##-----------------------------------------------------------------------------
## Documentation starting with '# ' (hash space) as well as lines consisting
## of exactly one hash will be passed to POD, see perlpod(1), with the hash
## and one space removed. You may pass code from the makefile as well,
## to do so include it between lines consisting of exactly '# ==code' and 
## '# ==end'. The code will be indented, and thus formatted as code by POD.
##-----------------------------------------------------------------------------


# =head1 NAME
#
# B<Chicle> - a simple framework for writing and publishing LaTeX documents
#
#
# =head1 SYNOPSIS
# 
# make [B<default>|B<all>|B<pdf>|B<ps>|B<dvi>|B<print>|B<view>|B<preview>|...]
# 
# make B<help>|B<man>
# 
# 
# =head1 DESCRIPTION
# 
# B<Chicle> is a simple framework for writing and publishing LaTeX documents.
#
# =head2 What does chicle mean?
#
# Chicle is the gum from Manilkara chicle, a species of sapodilla
# tree. It is a tropical evergreen tree, native to in Central America
# and South America. It is the traditional material used in chewing
# gum.
#
# The tree is also grown for its fruit which is plum-sized and has a
# translucent brown flesh. The tapping of the gum is similar to the
# tapping of latex from the rubber tree. Zigzag gashes are made in the
# tree trunk and the dripping gum is collected in small bags. Locals
# who collect chicle are called chicleros. This is then boiled till it
# reaches the correct thickness. Widespread tapping has lead to the
# tree becoming scarce and other sources like the related Balatá
# (Manilkara bidentata) are being increasingly used. Many modern
# chewing gums use petroleum based plastic instead of chicle.
#
# Chicle was well known to the Aztec and Maya Indians and the early
# European settlers prized it for its subtle flavour and high sugar
# content.
#
# (Source: L<http://en.wikipedia.org/wiki/Chicle>)
#
# =head2 Requirements
#
# B<Chicle> needs some external programs to work. Most of them are
# configurable (see L<"CONFIGURATION"> for more information like
# default values and how to change them).
#
# =over 10
#
# =item * GNU make
#
# =item * LaTeX, pdfTeX and BibTeX
#
# =item * latexmk
#
# Version 4.13a is provided in the F<bin/> directory.
#
# =item * ps2pdf, epstopdf, pdftops and pdfnup
#
# =item * PDF viewer (e.g. I<xpdf>)
#
# =item * PS viewer (e.g. I<gv>)
#
# =item * DVI viewer (e.g. I<xdvi>)
#
# =item * LaTeX checker (e.g. I<lacheck>)
#
# =item * Perl and I<perl-doc>
# 
# Only used to create and recreate documentation. Not needed for
# normal use.
#
# =back
#
# =head2 Compatibility Note
#
# The main test platform of B<Chicle> is GNU Make 3.80 and teTeX 2.0.2 on
# Debian and Ubuntu GNU/Linux.
#
# 
# =head1 CONFIGURATION
#

##-----------------------------------------------------------------------------
## User configuration
##-----------------------------------------------------------------------------

# =head2 Main configuration
#
# =over 10
#
# =item project-name
# 
# Sets the name of the project as used by the C<archive> target.
project-name = chicle

# 
# =item document-name
# 
# Sets the name of the main LaTeX file. This must be equal to the base
# name (without the F<.tex> ending) of a LaTeX file in the F<source/>
# directory.
document-name = book

#
# =item version 
#
# Sets the version number as used by the C<archive> target.
version = 2.1

#
# =item archive-type
#
# Sets the file type as used by the C<archive> target. Possible values 
# are I<tar.gz> and I<zip>.
#
# The default value is I<tar.gz>.
archive-type = tar.gz

#
# =item archive-format
#
# Sets the version format as used by the C<archive> target. Possible
# values are I<version>, I<date> and I<version-date>. 
#
# The default value is I<version>.
archive-format = version

#
# =item paper-format
#
# Sets the default paper format used by C<dvips> and C<pdfnup>. 
#
# The default value is I<a4>.
paper-format = a4

#
# =item quiet
# 
# Sets whether latexmk should be run with option I<-quiet> or
# not. 
# 
# Possible values are I<yes> and I<no>. The default value is I<yes>.
quiet = yes

#
# =item force
# 
# Sets whether latexmk should be run with option I<-f> or
# not. 
# 
# Possible values are I<yes> and I<no>. The default value is I<yes>.
force = yes

#
# =item pdf-creation
#
# Sets the command used to create a PDF version of the LaTeX
# document. 
#
# Possible values are I<pdflatex>, I<dvipdf> and I<ps2pdf>. The
# default value is I<pdflatex>.
pdf-creation = pdflatex

#
# =back
#
# =head2 Defaults
#
# =over 10
#
# =item default-format
# 
# Sets the default format used by C<make default> or C<make>.
# 
# Possible values are I<pdf>, I<ps> and I<dvi>. The default value is
# I<pdf>.
default-format = pdf

#
# =item default-nup-format
#
# Sets the default format used by the C<nup> targets. 
#
# Possible values are I<pdf> and I<ps>. The default value is I<pdf>.
default-nup-format = pdf

#
# =item default-view-format
#
# Sets the default format used by the C<view> targets. 
#
# Possible values are I<pdf>, I<ps> and I<dvi>. The default value is
# I<pdf>.
default-view-format = pdf

#
# =item default-preview-format
#
# Sets the default format used by the C<preview> target. 
# 
# Possible values are I<pdf>, I<ps> and I<dvi>. The default value is
# I<pdf>.
default-preview-format = pdf

#
# =item default-print-format
#
# Sets the default format used by the C<print> targets. 
# 
# Possible values are I<pdf>, I<ps> and I<dvi>. The default value is
# I<pdf>.
default-print-format = pdf


#
# =back
#
# =head2 File names
#
# =over 10
#
# =item readme-file
#
# Sets the name of the 'Read me' file.
# 
# The default value is I<README.chicle>.
readme-file = README.chicle

#
# =item make-file
#
# Sets the name of the Makefile.
# 
# The default value is I<Makefile>.
make-file = Makefile


#
# =back
#
# =head2 Directory names
#
# =over 10
#
# =item bib-dir
#
# Sets the name of the directory containing the BibTeX files.
#
# The default value is I<bib>.
bib-dir = bib

#
# =item bin-dir
#
# Sets the name of the directory containing additional programs used
# by B<Chicle>, like latexmk.
# 
# The default value is I<bin>.
bin-dir = bin

#
# =item build-dir
#
# Sets the name of the directory used to build the document. This is
# where all the intermediate files are saved to. The build directory
# gets automatically created if needed.
# 
# The default value is I<build>.
build-dir = build

#
# =item doc-dir
#
# Sets the name of the documentation directory. This directory is used
# by the C<docs> target.
# 
# The default value is I<doc>.
doc-dir = doc

#
# =item output-dir
# 
# Sets the name of the directory used to save the output files. This
# is where all the generated files are saved to. The output directory
# gets automatically created if needed.
# 
# The default value is I<output>.
output-dir = output

#
# =item source-dir
#
# Sets the name of the directory containing the LaTeX sources.
# 
# The default value is I<source>.
source-dir = source

#
# =item styles-dir
#
# Sets the name of the directory containing additional LaTeX styles,
# e.g. F<.bst>, F<.cls> and F<.sty> files.
# 
# The default value is I<styles>.
styles-dir = styles


#
# =back
#
# =head2 Documentation
#
# =over 10
#
# =item doc-style
# 
# Sets the name of the CSS file used by I<pod2html>. The path of the
# file is relative to C<doc-dir>.
# 
# The default value is I<style.css>.
doc-style = style.css

#
# =item doc-backlink
#
# Sets the text used as backlink by I<pod2html>.
# 
# The default value is I<[ back to top ]>.
doc-backlink = "[ back to top ]"


#
# =back
#
# =head2 Programs
#
# =over 10
#
# =item pdf-viewer
#
# Sets the viewer used to view PDF files.
# 
# The default value is I<xpdf>.
pdf-viewer = xpdf

#
# =item ps-viewer
#
# Sets the viewer used to view PS files.
# 
# The default value is I<gv>.
ps-viewer = gv

#
# =item dvi-viewer
#
# Sets the viewer used to view DVI files.
# 
# The default value is I<xdvi>.
dvi-viewer = xdvi

#
# =item dia
#
# Sets the command used to convert F<.dia> files to F<.eps> files.
# 
# The default value is I<dia -e>.
dia = dia -e

#
# =item figtodev
#
# Sets the program used to convert F<.fig> files.
# 
# The default value is I<fig2dev>.
figtodev = fig2dev

#
# =item giftopnm
#
# Sets the program used to convert F<.gif> files.
# 
# The default value is I<giftopnm>.
giftopnm = giftopnm

#
# =item pnmtopng
#
# Sets the program used to convert F<.pnm> files.
# 
# The default value is I<pnmtopng>.
pnmtopng = pnmtopng

#
# =item syntax-check
#
# Sets the command used to check the syntax of LaTeX files.
# 
# The default value is I<lacheck>.
syntax-check = lacheck

#
# =item latexmk
#
# Sets the location of the latexmk script.
# 
# The default value is I<$(bin-dir)/latexmk>.
latexmk = $(bin-dir)/latexmk

#
# =item latex
#
# Sets the command used to process LaTeX files.
# 
# The default value is I<latex>.
latex = latex

#
# =item pdflatex
#
# Sets the command used to create PDF files from LaTeX files.
# 
# The default value is I<pdflatex>.
pdflatex = pdflatex

#
# =item bibtex
#
# Sets the command used to process BibTeX files.
# 
# The default value is I<bibtex>.
bibtex = bibtex

#
# =item makeindex
#
# Sets the command used to process index files.
# 
# The default value is I<makeindex>.
makeindex = makeindex

#
# =item dvips
#
# Sets the command used to process DVI files. 
#
# The default value is I<dvips -Ppdf -Z -t$(paper-format)>. This helps
# to generate PostScript which converts better to PDF.
dvips = dvips -Ppdf -Z -t$(paper-format)

#
# =item epstopdf
#
# Sets the command used to convert EPS files to PDF.
#
# The default value is I<epstopdf>.
epstopdf = epstopdf

#
# =item ps2pdf
#
# Sets the command used to convert PS files to PDF.
# 
# The default value is I<ps2pdf>.
pstopdf = ps2pdf

#
# =item pdftops
#
# Sets the command used to convert PDF files to PS.
# 
# The default value is I<pdftops>.
pdftops = pdftops

#
# =item pdfnup
#
# Sets the command used to convert a PDF document to a PDF file
# containing multiple pages per sheet.
# 
# The default value is I<pdfnup --paper$(paper-format)>.
pdfnup = pdfnup --paper $(paper-format)

#
# =item pdf-print
#
# Sets the command used to print PDF files.
# 
# The default value is I<lpr>.
pdf-print = lpr

#
# =item ps-print
#
# Sets the command used to print PS files.
# 
# The default value is I<lpr>.
ps-print = lpr

#
# =item dvi-print
#
# Sets the command used to print DVI files.
# 
# The default value is I<lpr>.
dvi-print = lpr

#
# =back
#


##-----------------------------------------------------------------------------
## Internal Makefile configuration 
##-----------------------------------------------------------------------------
## Do not edit!
##-----------------------------------------------------------------------------

.PHONY: default help man pdf ps dvi 2up 4up 8up \
	print print-2up print-4up print-8up \
	view view-2up view-4up view-8up \
	preview all check archive clean tidy \
	docs-clean docs

mainfile = $(source-dir)/$(document-name).tex

texfiles = $(shell find $(source-dir) -name '*.tex')
bibfiles = $(shell find $(bib-dir) -name '*.bib')
directories = $(shell find $(source-dir) -type d)
dirs = $(directories:$(source-dir)/%=$(build-dir)/%)

## Build and output files
pdffile = $(document-name:%=$(build-dir)/%.pdf)
pdffile-output = $(document-name:%=$(output-dir)/%.pdf)

pdffile-2up = $(document-name:%=$(build-dir)/%-2up.pdf)
pdffile-2up-output = $(document-name:%=$(output-dir)/%-2up.pdf)

pdffile-4up = $(document-name:%=$(build-dir)/%-4up.pdf)
pdffile-4up-output = $(document-name:%=$(output-dir)/%-4up.pdf)

pdffile-8up = $(document-name:%=$(build-dir)/%-8up.pdf)
pdffile-8up-output =$(document-name:%=$(output-dir)/%-8up.pdf)

psfile = $(document-name:%=$(build-dir)/%.ps)
psfile-output = $(document-name:%=$(output-dir)/%.ps)

psfile-2up = $(document-name:%=$(build-dir)/%-2up.ps)
psfile-2up-output = $(document-name:%=$(output-dir)/%-2up.ps)

psfile-4up = $(document-name:%=$(build-dir)/%-4up.ps)
psfile-4up-output = $(document-name:%=$(output-dir)/%-4up.ps)

psfile-8up = $(document-name:%=$(build-dir)/%-8up.ps)
psfile-8up-output = $(document-name:%=$(output-dir)/%-8up.ps)

dvifile = $(document-name:%=$(build-dir)/%.dvi)
dvifile-output = $(document-name:%=$(output-dir)/%.dvi)

## Documentation files
docfile = $(doc-dir)/chicle
docfile-html = $(docfile).html
docfile-man = $(docfile).man
docfile-pod = $(docfile).pod
docfile-ps = $(docfile).ps
docfile-txt = $(docfile).txt
docfile-usage = $(docfile).usage

## TeX and backup files
build-texfiles = $(texfiles:$(source-dir)/%=$(build-dir)/%)
backupfiles = $(shell find . -name "*~")


##-----------------------------------------------------------------------------
## Compute values for make targets
##-----------------------------------------------------------------------------

## Run latexmk with option `-quiet'?
ifeq "$(quiet)" "yes"
latexmk1 = $(latexmk) -quiet
else
latexmk1 = $(latexmk)
endif

## Run latexmk with option `-f'?
ifeq "$(force)" "yes"
latexmk-call = $(latexmk1) -f
else
latexmk-call = $(latexmk1)
endif

## Distribution file format
ifeq "$(archive-format)" "version"
archive-file = $(project-name)-$(version)
endif

ifeq "$(archive-format)" "date"
archive-file = $(shell date +$(project-name)-%Y-%m-%d)
endif

ifeq "$(archive-format)" "version-date"
archive-file = $(shell date +$(project-name)-$(version)-%Y-%m-%d)
endif

#
# =head1 GENERAL TARGETS
#

##-----------------------------------------------------------------------------
## General rules
##-----------------------------------------------------------------------------


#
# =head2 PDF, PS and DVI creation
#
# =over 10
#
# =item default
#
# Calls either the C<pdf>, C<ps> or C<dvi> target, depending on the
# value of the variable C<default-format>.
default: $(default-format)

#
# =item all
#
# Creates PDF, DVI and PS output.
all: pdf dvi ps

#
# =item pdf
#
# Creates PDF output.
pdf: $(pdffile) $(pdffile-output)

#
# =item ps
#
# Creates PS output.
ps: $(psfile) $(psfile-output)

#
# =item dvi
#
# Creates DVI output.
dvi: $(dvifile) $(dvifile-output)

#
# =back
#
# =head2 Multiple pages per sheet
#
# =over 10
#
# =item '2up'
#
# Creates PS or PDF output containing 2 pages per sheet.
# 
# To determine which output format to use, the variable
# C<default-nup-format> gets evaluated.
2up: $($(default-nup-format)file-2up) $($(default-nup-format)file-2up-output)

#
# =item '4up'
#
# Creates PS or PDF output containing 4 pages per sheet. 
#
# To determine which output format to use, the variable
# C<default-nup-format> gets evaluated.
4up: $($(default-nup-format)file-4up) $($(default-nup-format)file-4up-output)

#
# =item '8up'
#
# Creates PS or PDF output containing 8 pages per sheet. 
#
# To determine which output format to use, the variable
# C<default-nup-format> gets evaluated.
8up: $($(default-nup-format)file-8up) $($(default-nup-format)file-8up-output)

#
# =back
#
# =head2 Print
#
# =over 10
#
# =item print
#
# Prints the translated LaTeX document as PDF, PS or DVI. 
# 
# To determine which format should be used, the variable
# C<default-print-format> gets evaluated.
print: $($(default-print-format)file)
	@echo --- Printing $< ---
	@$($(default-print-format)-print) $<

ifneq "$(default-print-format)" "dvi"

#
# =item print-2up
#
# Prints the translated LaTeX document as PDF or PS containing 2 pages
# per sheet. 
# 
# To determine which format should be used, the variable
# C<default-print-format> gets evaluated.
print-2up: $($(default-print-format)file-2up)
	@echo --- Printing $< ---
	@$($(default-print-format)-print) $<

#
# =item print-4up
#
# Prints the translated LaTeX document as PDF or PS containing 4 pages
# per sheet. 
# 
# To determine which format should be used, the variable
# C<default-print-format> gets evaluated.
print-4up: $($(default-print-format)file-4up)
	@echo --- Printing $< ---
	@$($(default-print-format)-print) $<

#
# =item print-8up
#
# Prints the translated LaTeX document as PDF or PS containing 8 pages
# per sheet. 
#
# To determine which format should be used, the variable
# C<default-print-format> gets evaluated.
print-8up: $($(default-print-format)file-8up)
	@echo --- Printing $< ---
	@$($(default-print-format)-print) $<

endif


#
# =back
#
# =head2 View
#
# =over 10
#
# =item view
#
# Opens the translated LaTeX document in C<pdf-viewer>, C<ps-viewer>
# or C<dvi-viewer>. 
#
# To determine which format should be used, the variable
# C<default-view-format> gets evaluated.
view: $($(default-view-format)file-output)
	@echo --- Viewing $< ---
	@$($(default-view-format)-viewer) $<

ifneq "$(default-view-format)" "dvi"

#
# =item view-2up
#
# Opens the translated LaTeX document in C<pdf-viewer>, C<ps-viewer>
# or C<dvi-viewer> containing 2 pages per sheet. 
# 
# To determine which format should be used, the variable
# C<default-view-format> gets evaluated.
view-2up: $($(default-view-format)file-2up-output)
	@echo --- Viewing $< ---
	@$($(default-view-format)-viewer) $<

#
# =item view-4up
#
# Opens the translated LaTeX document in C<pdf-viewer>, C<ps-viewer>
# or C<dvi-viewer> containing 4 pages per sheet. 
#
# To determine which format should be used, the variable
# C<default-view-format> gets evaluated.
view-4up: $($(default-view-format)file-4up-output)
	@echo --- Viewing $< ---
	@$($(default-view-format)-viewer) $<

#
# =item view-8up
#
# Opens the translated LaTeX document in C<pdf-viewer>, C<ps-viewer>
# or C<dvi-viewer> containing 8 pages per sheet. 
# 
# To determine which format should be used, the variable
# C<default-view-format> gets evaluated.
view-8up: $($(default-view-format)file-8up-output)
	@echo --- Viewing $< ---
	@$($(default-view-format)-viewer) $<

endif


#
# =back
#
# =head2 Preview
#
# =over 10
#
# =item preview
#
# Previews the translatex LaTeX document and continuously updates. 
# 
# To determine which format should be used, the variable
# C<default-preview-format> gets evaluated.
preview: $(dirs) $(build-dir)/latexmk.rc $(texfiles) $(bibfiles)
	@echo --- Previewing $(document-name).$(default-preview-format) ---
	@cd $(build-dir); \
	  TEXINPUTS=../$(source-dir):../$(styles-dir):$$TEXINPUTS; export TEXINPUTS; \
	  BIBINPUTS=../$(source-dir):$$BIBINPUTS;           export BIBINPUTS; \
	  BSTINPUTS=../$(styles-dir):$$BSTINPUTS;           export BSTINPUTS; \
	  ../$(latexmk-call) -r latexmk.rc -pvc -$(default-preview-format) ../$(mainfile)


#
# =back
#
# =head2 Check
#
# =over 10
# 
# =item check
#
# Checks the LaTeX source with C<syntax-check>.
check: $(source-dir)/$(document-name).check


#
# =back
#
# =head2 Distribution
#
# =over 10
#
# =item archive
#
# Calls C<tidy> and creates an archive version of all distribution
# files.
archive: tidy
	@echo --- Making $(archive-file).$(archive-type) ---;
	@if test -d $(output-dir); then true; else mkdir $(output-dir); fi
ifeq "$(archive-type)" "tar.gz"
	@git archive --format=tar --prefix=$(archive-file)/ master | gzip >$(archive-file).tar.gz
else
	@git archive --format=zip --prefix=$(archive-file)/ master > $(archive-file).zip
endif
	@mv $(archive-file).$(archive-type) $(output-dir)


#
# =back
#
# =head2 Cleaning
#
# =over 10
#
# =item clean
#
# Removes intermediate and temporary files.
clean:
	@rm -f core \#* *.log *.ps *.tmp *.pdf *.bak
	@rm -f $(backupfiles)
	@rm -rf $(build-dir)

#
# =item tidy
#
# Removes intermediate, temporary and output files.
tidy: clean
	@rm -rf $(output-dir)


#
# =back
#
# =head1 PSEUDO FILE TARGETS
#

##-----------------------------------------------------------------------------
## Suffix rules
##-----------------------------------------------------------------------------

#
# =head2 Conversion
#
# =over 10
#
# =item %.pdf: %.eps
#
# Converts F<.eps> files to F<.pdf> with C<epstopdf>.
%.pdf: %.eps
	@echo --- Making $*.pdf figure from $< ---
	@$(epstopdf) --outfile=$@ $<

#
# =item %.eps: %.fig
#
# Converts F<.fig> files to F<.eps> with C<figtodev>.
%.eps: %.fig
	@echo --- Making $*.eps figure from $< ---
	@$(figtodev) -L eps $< >$@

#
# =item %.eps: %.dia
#
# Converts F<.dia> files to F<.eps> with C<dia>.
%.eps: %.dia
	@echo --- Making $*.eps figure from $< ---
	@$(dia) $@ $<

#
# =item %.pdf: %.fig
#
# Converts F<.fig> files to F<.pdf> with C<figtodev>.
%.pdf: %.fig
	@echo --- Making $*.pdf figure from $< ---
	@$(figtodev) -L pdf $< >$@

#
# =item %.png: %.gif
#
# Converts F<.gif> files to F<.png> with C<giftopnm> and
# C<pnmtopng>.
%.png: %.gif
	@echo --- Making $*.png figure from $< ---
	@$(giftopnm) $< | $(pnmtopng) > $@


#
# =back
#
# =head2 Miscellaneous
#
# =over 10
#
# =item %.check: %.tex
#
# Checks F<.tex> files with C<syntax-check>.
%.check: %.tex
	@echo --- Checking $< ---
	@$(syntax-check) $<


#
# =back
#
# =head1 DOCUMENTATION TARGETS
#

##----------------------------------------------------------------------------
## Makefile documentation stuff
##-----------------------------------------------------------------------------

#
# =head2 Help
#
# =over 10
#
# =item help
#
# Prints a short help message. Use the target C<man> to view the
# complete manual.
help:
	@cat $(docfile-usage)

#
# =item man
#
# Shows the complete manual.
man:
	@man -l $(docfile-man)

#
# =back
#
# =head2 Documentation
#
# =over 10
#
# =item docs-clean
#
# Cleans the documentation directory.
docs-clean:
	@echo --- Cleaning $(doc-dir) ---
	@rm -f $(docfile-pod) $(docfile-man) $(docfile-ps) $(docfile-html) \
		$(docfile-usage) $(docfile-txt)
	@mkdir -p $(doc-dir)

#
# =item docs
# 
# Creates documentation. This target needs Perl and and I<perl-doc> to
# generate the different documentation formats.
docs: docs-clean $(docfile-pod) $(docfile-man) $(docfile-ps) $(docfile-html) \
	$(docfile-txt) $(docfile-usage)

#
# =back
#


##-----------------------------------------------------------------------------
## Dependent rules
##-----------------------------------------------------------------------------

$(build-dir)/latexmk.rc:
	@echo --- Writing latexmk.rc ---;
	@if test -d $(build-dir); then true; else mkdir $(build-dir); fi
	@echo "\$$bibtex = '$(bibtex)';" >> $@;
	@echo "\$$makeindex = '$(makeindex)';" >> $@;
	@echo "\$$latex = '$(latex)';" >> $@;
	@echo "\$$dvips = '$(dvips)';" >> $@;
	@echo "\$$ps2pdf = '$(pstopdf)';" >> $@;
	@echo "\$$pdflatex = '$(pdflatex)';" >> $@;
	@echo "\$$dvi_previewer = '$(dvi-viewer)';" >> $@;
	@echo "\$$pdf_previewer = '$(pdf-viewer)';" >> $@;
	@echo "\$$ps_previewer = '$(ps-viewer)';" >> $@;

ifeq "$(pdf-creation)" "pdflatex"
$(pdffile): $(dirs) $(build-dir)/latexmk.rc $(texfiles) $(bibfiles)
	@echo --- Making $@ ---
	@cd $(build-dir); \
	  TEXINPUTS=../$(source-dir):../$(styles-dir):$$TEXINPUTS; export TEXINPUTS; \
	  BIBINPUTS=../$(source-dir):$$BIBINPUTS;           export BIBINPUTS; \
	  BSTINPUTS=../$(styles-dir):$$BSTINPUTS;           export BSTINPUTS; \
	  ../$(latexmk-call) -r latexmk.rc -pdf ../$(mainfile)
endif

ifeq "$(pdf-creation)" "ps2pdf"
$(pdffile): $(dirs) $(build-dir)/latexmk.rc $(texfiles) $(bibfiles)
	@echo --- Making $@ ---
	@cd $(build-dir); \
	  TEXINPUTS=../$(source-dir):../$(styles-dir):$$TEXINPUTS; export TEXINPUTS; \
	  BIBINPUTS=../$(source-dir):$$BIBINPUTS;           export BIBINPUTS; \
	  BSTINPUTS=../$(styles-dir):$$BSTINPUTS;           export BSTINPUTS; \
	  ../$(latexmk-call) -r latexmk.rc -pdfps ../$(mainfile)
endif

ifeq "$(pdf-creation)" "dvipdf"
$(pdffile): $(dirs) $(build-dir)/latexmk.rc $(texfiles) $(bibfiles)
	@echo --- Making $@ ---
	@cd $(build-dir); \
	  TEXINPUTS=../$(source-dir):../$(styles-dir):$$TEXINPUTS; export TEXINPUTS; \
	  BIBINPUTS=../$(source-dir):$$BIBINPUTS;           export BIBINPUTS; \
	  BSTINPUTS=../$(styles-dir):$$BSTINPUTS;           export BSTINPUTS; \
	  ../$(latexmk-call) -r latexmk.rc -pdfdvi ../$(mainfile)
endif

$(psfile): $(dirs) $(build-dir)/latexmk.rc $(texfiles) $(bibfiles)
	@echo --- Making $@ ---
	@cd $(build-dir); \
	  TEXINPUTS=../$(source-dir):../$(styles-dir):$$TEXINPUTS; export TEXINPUTS; \
	  BIBINPUTS=../$(source-dir):$$BIBINPUTS;           export BIBINPUTS; \
	  BSTINPUTS=../$(styles-dir):$$BSTINPUTS;           export BSTINPUTS; \
	  ../$(latexmk-call) -r latexmk.rc -ps ../$(mainfile)

$(dvifile): $(dirs) $(build-dir)/latexmk.rc $(texfiles) $(bibfiles)
	@echo --- Making $@ ---
	@cd $(build-dir); \
	  TEXINPUTS=../$(source-dir):../$(styles-dir):$$TEXINPUTS; export TEXINPUTS; \
	  BIBINPUTS=../$(source-dir):$$BIBINPUTS;           export BIBINPUTS; \
	  BSTINPUTS=../$(styles-dir):$$BSTINPUTS;           export BSTINPUTS; \
	  ../$(latexmk-call) -r latexmk.rc ../$(mainfile)

## nup targets
$(pdffile-2up): $(pdffile)
	@echo --- Making $@ ---
	@$(pdfnup) --nup "2x1" --outfile $@ $<

$(pdffile-4up): $(pdffile)
	@echo --- Making $@ ---
	@$(pdfnup) --nup "2x2" --outfile $@ $<

$(pdffile-8up): $(pdffile)
	@echo --- Making $@ ---
	@$(pdfnup) --nup "4x2" --outfile $@ $<

$(psfile-2up): $(pdffile-2up)
	@echo --- Making $@ ---
	@$(pstopdf) $< $@

$(psfile-4up): $(pdffile-4up)
	@echo --- Making $@ ---
	@$(pstopdf) $< $@

$(psfile-8up): $(pdffile-8up)
	@echo --- Making $@ ---
	@$(pstopdf) $< $@

## Documentation
$(docfile-pod): $(make-file)
	@echo --- Creating $@ ---
	@sed -n \
		-e '/^# ==code/,/^# ==end/s/^/	/p' \
		-e 's/^# //p' \
		-e 's/^#$$//p' \
		$< |\
		sed '/^	# ==/d' \
		> $@

$(docfile-man): $(docfile-pod)
	@echo --- Creating $@ ---
	@pod2man -c '' -s1 -l -r '$(version)' $< > $@

$(docfile-ps): $(docfile-man)
	@echo --- Creating $@ ---
	@man -t -l $< > $@

$(docfile-html): $(docfile-pod)
	@echo --- Creating $@ ---
	@pod2html --css $(doc-style) --backlink $(doc-backlink) $< --title \
		"Chicle $(version)" --outfile $@
	@rm -f pod2htmd.tmp pod2htmi.tmp

$(docfile-txt): $(docfile-pod)
	@echo --- Creating $@ ---
	@pod2text $< > $@
	@cp $@ $(readme-file)

$(docfile-usage): $(docfile-pod)
	@echo --- Creating $@ ---
	@pod2usage $< -output $@ -exit 0


##-----------------------------------------------------------------------------
## Internal suffix rules
##-----------------------------------------------------------------------------

$(output-dir)/%.pdf: $(build-dir)/%.pdf
	@if test -d $(output-dir); then true; else mkdir $(output-dir); fi
	@echo --- Copying $< to $@ --
	@cp $< $@

$(output-dir)/%.ps: $(build-dir)/%.ps
	@if test -d $(output-dir); then true; else mkdir $(output-dir); fi
	@echo --- Copying $< to $@ --
	@cp $< $@

$(output-dir)/%.dvi: $(build-dir)/%.dvi
	@if test -d $(output-dir); then true; else mkdir $(output-dir); fi
	@echo --- Copying $< to $@ --
	@cp $< $@

$(build-dir)/%:
	@echo --- Creating $@ ---
	@mkdir -p $@


#
# =head1 SUPPORT
#
# Contact the L</"AUTHOR">.
#
#
# =head1 BUGS
#
# Unknown
#
#
# =head1 ACKNOWLEDGEMENTS
#
# B<Chicle> is based on
#
# =over
#
# =item Makefile.latex 
# 
# by Thorsten Vitt <thvitt@gmx.de>, revision 1.16 from 2005/04/19. See
# L<http://www.informatik.hu-berlin.de/~vitt/latex/make> for the
# newest version.
#
# =item Dissertation Template
# 
# by David Coppit, version 0.23. See
# L<http://www.coppit.org/code/> for the newest version.
#
# =back
#
#
# =head1 VERSION
#
# B<Chicle> 2.1
#
#
# =head1 AUTHOR
#
# Thomas Weibel, <thom@beeblebrox.net>
#
#
# =head1 COPYRIGHT
#
# Copyright (c) 2008-2010 Thomas Weibel, <thom@beeblebrox.net>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

#!/bin/bash
set -exo
quarto render --to revealjs
quarto render --to pptx
quarto render notebook.qmd --to pdf
quarto render notebook.qmd --to revealjs
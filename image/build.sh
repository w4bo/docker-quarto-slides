#!/bin/bash
set -exo
# quarto preview notebook.qmd --execute
quarto render --to revealjs
quarto render --to pptx
quarto render --to pdf
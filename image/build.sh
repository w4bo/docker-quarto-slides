#!/bin/bash
set -exo
quarto render --to revealjs
quarto render --to pptx
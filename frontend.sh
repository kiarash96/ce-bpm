#!/bin/sh
npm --prefix ./frontend install
npm --prefix ./frontend run build -- --base=/forms/ --outDir=../backend/src/main/resources/static/forms --emptyOutDir --watch

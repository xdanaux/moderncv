#!/bin/bash
for file in *.aux ; do
	bibtex ‘basename $file .aux‘
done
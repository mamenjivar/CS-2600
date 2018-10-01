#!/bin/bash
# Miguel Menjivar
# HW 02
# CS 2600

function comchar() {
    case "$1" in
       java|cpp|c)
           echo '//'
           ;;
       lisp|elisp)
           echo ';'
           ;;
       *)
           echo '#'
           ;;
    esac
}

COMMENT_CHARACTER=$(comchar $2)

# gets total number of lines of file
line_count=$(wc -l $1 | cut -d' ' -f1)

# gets total number of lines that are comments
comment_count=$(grep -c $COMMENT_CHARACTER $1)

# gets total number of lines that are blank
blank_lines=$(grep -c '^\s*$' $1)

echo "Total Lines  : $line_count"
echo "Comments     : $comment_count"
echo "Blank lines  : $blank_lines"
echo "Only Braces  :"
echo "Actual Code  :"
echo $1
echo $2

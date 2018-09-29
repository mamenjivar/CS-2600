# Miguel Menjivar
# CS 2600
# HW 01

# gets the number of lines in this dictionary file
a=$(wc -l /usr/share/dict/words | cut -d' ' -f1)

# gets a random number based on the number of lines from the dictionary file
b=$(( ($RANDOM % $a)+1 ))

# prints out a random word from the dictionary
head -n $b /usr/share/dict/words | tail +$b

# the issue with this script is that I am not able to remove the
# apostrophes that are contained in the word. It just issues an error

"""
Transforms a string represented as a list of characters into its Pig Latin 
version.

Args:
    l: a list of characters representing one of the input strings
       e.g., l = ['a', 'p', 'p', 'l', 'e'] represents the string "apple"
    
Returns:
    A list of characters representing the pig latin version of the string 
    represented by argument l. The function is also supposed to change the
    list l in place to its pig latin version.
       e.g., for argument l = ['a', 'p', 'p', 'l', 'e'], the return should be
       ['a', 'p', 'p', 'l', 'e', 'w', 'a', 'y'] and also the argument l should
       be changed to value ['a', 'p', 'p', 'l', 'e', 'w', 'a', 'y'].
"""
def ToPigLatin(l):
    vowels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
    consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y','z', 'B', 'C', 'D', 
    'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'O', 'P']
    word = ''.join(l)  # Combine the list into a word
    first_letter = word[0]
    
    #rule 4: you may assume word is no more than 39 characters long. 
    if first_letter.lower() in vowels:
        # Rule 2: If the word starts with a vowel, append 'way' to the end
        pig_latin = word + 'way'
    else:
        # Rule 3: Word starts with consonant(s)
        consonant_cluster = []
        for char in l:
            if char.lower() in vowels or (char.lower() == 'y' and len(consonant_cluster) > 0) or (char.lower() == 'w' and len(consonant_cluster) > 0):
                break
            consonant_cluster.append(char)
        remaining = l[len(consonant_cluster):]
        pig_latin = ''.join(remaining) + ''.join(consonant_cluster) + 'ay'
    
    # Maintain capitalization of the first letter
    if l[0].isupper():
        pig_latin = pig_latin.capitalize()
    
    # Update the list in place
    l.clear()
    l.extend(list(pig_latin))
    return l

# Main -- do not change the code below
s = input('Enter 5 strings separated by one blank space: ')
myList = s.strip().split(' ')

resList = []
for i in range(3):
    l = list(myList[i])
    ToPigLatin(l)
    resList.append(''.join(l))
for i in range(3, 5):
    l = list(myList[i])
    resList.append(''.join(ToPigLatin(l)))
    
print(' '.join(resList))

# list of alphabets
alphabets = ['a', 'b', 'd', 'e', 'j', 'o']

# function that filters vowels
def filterVowels(alphabet):
    vowels = ['a', 'e', 'i', 'o', 'u']

    if(alphabet in vowels):
        return True
    else:
        return False

filteredVowels = list(filter(filterVowels, alphabets))
print filteredVowels
print('The filtered vowels are:')
for vowel in filteredVowels:
    print(vowel)

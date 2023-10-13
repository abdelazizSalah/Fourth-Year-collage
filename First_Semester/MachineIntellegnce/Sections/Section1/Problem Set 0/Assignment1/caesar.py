from typing import Tuple, List
import utils
from helpers.test_tools import read_text_file, read_word_list

'''
    The DecipherResult is the type defintion for a tuple containing:
    - The deciphered text (string).
    - The shift of the cipher (non-negative integer).
        Assume that the shift is always to the right (in the direction from 'a' to 'b' to 'c' and so on).
        So if you return 1, that means that the text was ciphered by shifting it 1 to the right, and that you deciphered the text by shifting it 1 to the left.
    - The number of words in the deciphered text that are not in the dictionary (non-negative integer).
'''
DechiperResult = Tuple[str, int, int]
letterDict = {
    'a': 0,
    'b': 1,
    'c': 2,
    'd': 3,
    'e': 4,
    'f': 5,
    'g': 6,
    'h': 7,

    'i': 8,
    'j': 9,
    'k': 10,
    'l': 11,
    'm': 12,
    'n': 13,
    'o': 14,

    'p': 15,
    'q': 16,
    'r': 17,
    's': 18,
    't': 19,
    'u': 20,
    'v': 21,
    'w': 22,
    'x': 23,
    'y': 24,
    'z': 25

}


def caesar_dechiper(ciphered: str, dictionary: List[str]) -> DechiperResult:
    '''
        This function takes the ciphered text (string)  and the dictionary (a list of strings where each string is a word).
        It should return a DechiperResult (see above for more info) with the deciphered text, the cipher shift, and the number of deciphered words that are not in the dictionary. 
    '''
    '''
        Algorithm is as follows: 
            1. Using each possible shift
                1. decipher the ciphered text
                2. count the number of words that are not in the dictionary
                3. return the deciphered text with the least number of words out of the dictionary. 
    '''
    # ciphered = ciphered.split()
    # minimumNumberOfWords: int = 1e10
    # decipheredRes: str = ''
    # bestShift = 0
    # #! using each possible shift (0 - 25)
    # for possibleCipherCounter in range(26):
    #     counter: int = 0
    #     # ? count the number of words that are not in the dictionary
    #     TotalWord: str = ''
    #     for word in ciphered:
    #         word = word.lower()
    #         newString: str = ''
    #         for c in word:
    #             # ! we should use the mod here!
    #             newString += chr(97 +
    #                              ((letterDict[c] - possibleCipherCounter) % 26))
    #         if newString not in dictionary:
    #             counter += 1
    #         TotalWord += ' ' + newString
    #     if(counter < minimumNumberOfWords):
    #         decipheredRes = TotalWord
    #         bestShift = possibleCipherCounter
    #         minimumNumberOfWords = counter
    # return (decipheredRes[1:], bestShift, minimumNumberOfWords)

    #! in more compact way.
    dictionary = set(dictionary)  # ? to avoid O(N) lookup
    best_shift, min_word_count, deciphered_res = 0, float('inf'), ''
    for possible_cipher_counter in range(26):
        counter = sum(1 for word in ciphered.split() if ''.join(chr(
            (97 + (letterDict[c] - possible_cipher_counter) % 26)) for c in word.lower()) not in dictionary)
        if counter < min_word_count:
            min_word_count, best_shift, deciphered_res = counter, possible_cipher_counter, ' '.join(''.join(chr(
                (97 + (letterDict[c] - possible_cipher_counter) % 26)) for c in word.lower()) for word in ciphered.split())
    return deciphered_res, best_shift, min_word_count

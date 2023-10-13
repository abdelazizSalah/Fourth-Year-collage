import utils


def palindrome_check(string: str) -> bool:
    '''
    This function takes string and returns where a string is a palindrome or not
    A palindrome is a string that does not change if read from left to right or from right to left
    Assume that empty strings are palindromes
    '''

    #! lower all characters
    string = string.lower()
    length: int = len(string)
    for i in range(length // 2):
        if string[i] != string[-1-i]:
            return False
    return True

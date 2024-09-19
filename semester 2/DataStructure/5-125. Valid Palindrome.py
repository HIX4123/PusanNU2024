def validPalindrome(s):
    """
    Determines if a given string can be a palindrome by removing at most one character.
    A palindrome is a string that reads the same forward and backward. This function checks if the input string `s` can 
    be transformed into a palindrome by removing at most one character.
    Args:
        s (str): The input string to be checked.
    Returns:
        bool: True if the string can be a palindrome by removing at most one character, False otherwise.
    Example:
        validPalindrome("abca") -> True
        validPalindrome("racecar") -> True
        validPalindrome("abcdef") -> False
    """
    def isPalindrome(start, end):
        """
        Check if the substring of 's' from index 'start' to 'end' is a palindrome.

        Args:
            start (int): The starting index of the substring.
            end (int): The ending index of the substring.

        Returns:
            bool: True if the substring is a palindrome, False otherwise.
        """
        while start < end:
            if s[start] != s[end]:
                return False
            start += 1
            end -= 1
        return True

    start, end = 0, len(s) - 1
    while start < end:
        if s[start] != s[end]:
            if isPalindrome(start + 1, end) or isPalindrome(start, end - 1):
                return True
            else:
                return False
            #return isPalindrome(start + 1, end) or isPalindrome(start, end - 1)
        start += 1
        end -= 1
    return True

print(validPalindrome("abfcacba"))
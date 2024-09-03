def validPalindrome(s):
    def isPalindrome(start, end):
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
class Solution:
    def isHappy(self, n: int) -> bool:
        """
        Determines whether a number is a happy number.
        Parameters:
        - n (int): The number to be checked.
        Returns:
        - bool: True if the number is a happy number, False otherwise.
        """
        loop = set([n])
        while True:
            next_n = sum(int(i) ** 2 for i in str(n))

            if next_n == 1:
                return True
            elif next_n in loop:
                return False
            else:
                n = next_n
                loop.add(n)


if __name__ == "__main__":
    print(Solution.isHappy(0, 7))

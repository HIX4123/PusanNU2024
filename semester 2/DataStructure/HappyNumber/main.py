class Solution:
    def isHappy(self, n: int) -> bool:
        loop = set([n])
        while True:
            next_n = sum(int(i)**2 for i in str(n))

            if next_n == 1:
                return True
            elif next_n in loop:
                return False
            else:
                n = next_n
                loop.add(n)


if __name__ == "__main__":
    print(Solution.isHappy(0, 7))

def mismatch_count(s1: str, s2: str) -> int:
    return sum(0 if i == j else 1 for i, j in zip(s1, s2))


def find_approximate_matches(dna: str, sub: str, k: int) -> list[int]:
    out = []
    for i in range(len(dna) - len(sub) - k + 1):
        var = mismatch_count(sub, dna[i : i + len(sub)])
        if var <= k:
            out.append(i)
    return out


def main():
    dna = input()
    sub = input()
    k = int(input())
    indices = find_approximate_matches(dna, sub, k)
    print(indices)


if __name__ == "__main__":
    main()

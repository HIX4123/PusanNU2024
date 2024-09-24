from math import comb


def generate_pascals_triangle(n: int) -> list[list[int]]:
    """
    Generate Pascal's Triangle up to the nth row.

    Args:
        n (int): The number of rows of Pascal's Triangle to generate.

    Returns:
        list[list[int]]: A list of lists, where each inner list represents a row of Pascal's Triangle.
    """
    return [[comb(i, j) for j in range(i + 1)] for i in range(n)]


def print_pascals_triangle(triangle: list[list[int]]) -> None:
    """
    Prints Pascal's Triangle in a formatted manner.

    Args:
        triangle (list[list[int]]): A 2D list representing Pascal's Triangle, 
                                    where each inner list is a row of the triangle.
    """
    length: int = len(triangle)
    for index, value in enumerate(triangle):
        print(" " * (length - index - 1) + " ".join(map(str, value)))


if __name__ == "__main__":
    n = int(input())
    pascal_triangle = generate_pascals_triangle(n)
    print_pascals_triangle(pascal_triangle)

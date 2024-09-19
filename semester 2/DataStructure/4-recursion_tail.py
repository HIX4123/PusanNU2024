def foo(n):
    """
    Recursively prints numbers from 1 to n in ascending order.
    This function uses tail recursion to print each number from 1 up to the given number `n`.
    The base case is when `n` is 0, at which point the recursion stops.
    Parameters:
    n (int): The number up to which the function will print numbers in ascending order.
    Returns:
    None
    """
    if n == 0: # Base case
        return
    
    foo(n - 1) # Recursive case
    print(n)   # Body  
    
x = 3
foo(x)
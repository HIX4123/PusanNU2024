def foo(n):
    """
    Recursively prints numbers from n down to 1.
    Args:
        n (int): The starting integer to print from. Should be a non-negative integer.
    Returns:
        None
    Example:
        foo(3) will print:
        3
        2
        1
    """
    if n == 0: # Base case
        return
    
    print(n)   # Body  
    foo(n - 1) # Recursive case

x = 3
foo(x)
def foo(n):
    if n == 0: # Base case
        return
    
    foo(n - 1) # Recursive case
    print(n)   # Body  
    
x = 3
foo(x)
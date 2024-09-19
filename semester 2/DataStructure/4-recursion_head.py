def foo(n):
    if n == 0: # Base case
        return
    
    print(n)   # Body  
    foo(n - 1) # Recursive case

x = 3
foo(x)
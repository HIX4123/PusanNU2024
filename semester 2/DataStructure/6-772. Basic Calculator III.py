class Stack :
    """
    A simple stack implementation.
    
    This class provides basic stack operations such as push, pop, peek, and check if the stack is empty. 
    It also includes methods to get the size of the stack, clear the stack, and get a string representation 
    of the stack's elements in reverse order.
    
    Methods:
    --------
        __init__(): Initializes a new instance of the Stack class.
        isEmpty(): Checks if the stack is empty.
        size(): Returns the size of the stack.
        clear(): Clears the stack.
        push(item): Pushes an item onto the top of the stack.
        pop(): Removes and returns the last element from the stack if it is not empty.
        peek(): Returns the top element of the stack without removing it.
        __str__(): Returns a string representation of the stack with elements in reverse order.
    """
    
    def __init__( self ):
        """
        Initializes a new instance of the class.

        Attributes:
            top (list): An empty list that will be used to store elements.
        """
        self.top = []

    def isEmpty( self ):
        """
        Check if the stack is empty.

        Returns:
            bool: True if the stack is empty, False otherwise.
        """
        return len(self.top) == 0
    def size( self ):
        """
        Returns the size of the stack.

        This method returns the number of elements currently in the stack by 
        calculating the length of the 'top' attribute.

        Returns:
            int: The number of elements in the stack.
        """
        return len(self.top)
    def clear( self ):
        """
        Clears the stack by resetting it to an empty list.

        This method is used to reset the internal stack to an empty state,
        effectively clearing any previously stored data.
        """
        self.top = []

    def push( self, item ):
        """
        Pushes an item onto the top of the stack.

        Args:
            item: The item to be pushed onto the stack.
        """
        self.top.append(item)

    def pop( self ):
        """
        Removes and returns the last element from the stack if it is not empty.

        Returns:
            The last element of the stack if the stack is not empty.
            None if the stack is empty.
        """
        if not self.isEmpty():
            return self.top.pop(-1)

    def peek( self ):
        """
        Returns the top element of the stack without removing it.

        Returns:
            The top element of the stack if it is not empty; otherwise, None.
        """
        if not self.isEmpty():
            return self.top[-1]

    def __str__(self ):
        """
        Returns a string representation of the stack with elements in reverse order.

        Returns:
            str: A string representation of the stack's elements in reverse order.
        """
        return str(self.top[::-1])

#----------------------------------------------------------------------
# Step 1: Infix→postfix 방법
#----------------------------------------------------------------------

def precedence (op):
    """
    Determine the precedence of a given operator.

    Parameters:
    op (str): A single character string representing an operator. 
                Valid operators are '(', ')', '+', '-', '*', and '/'.

    Returns:
    int: An integer representing the precedence level of the operator.
            - Returns 0 for parentheses '(' and ')'.
            - Returns 1 for addition '+' and subtraction '-'.
            - Returns 2 for multiplication '*' and division '/'.
            - Returns -1 for any other input.
    """
    if   op=='(' or op==')' : return 0
    elif op=='+' or op=='-' : return 1
    elif op=='*' or op=='/' : return 2
    else : return -1


def Infix2Postfix( expr ):
    """
    Converts an infix expression to a postfix expression.
    Args:
        expr (str): The infix expression to be converted.
    Returns:
        list: A list of tokens representing the postfix expression.
    The function uses a stack to hold operators and ensures that the 
    operators are placed in the correct order in the output list based 
    on their precedence. Parentheses are used to override the precedence 
    rules and are handled appropriately.
    Example:
        >>> Infix2Postfix("3 + 4 * 2 / ( 1 - 5 )")
        ['3', '4', '2', '*', '1', '5', '-', '/', '+']
    """
    s = Stack()
    output = []
    for term in expr :
        if term in '(' :
            s.push('(')
        elif term in ')' :
            while not s.isEmpty() :
                op = s.pop()
                if op=='(' : break;
                else :
                    output.append(op)
        elif term in "+-*/" :
            while not s.isEmpty() :
                op = s.peek()
                if( precedence(term) <= precedence(op)):
                    output.append(op)
                    s.pop()
                else: break
            s.push(term)
        else :
            output.append(term)

    while not s.isEmpty() :
        output.append(s.pop())

    return output

infix_expr = "2*(5+5*2)/3+(6/2+8)"
print('  중위표기: ', infix_expr)

postfix_expr = Infix2Postfix(infix_expr)
print('  후위표기: ', postfix_expr)

#----------------------------------------------------------------------
# Step2: Postfix 수식의 계산
#----------------------------------------------------------------------

def evalPostfix( expr ):
    """
    Evaluate a postfix expression.
    Args:
        expr (list of str): The postfix expression to evaluate, where each element is either an operand (as a string) or an operator ('+', '-', '*', '/').
    Returns:
        float: The result of evaluating the postfix expression.
    Raises:
        IndexError: If the expression is malformed and there are not enough operands for an operator.
        ValueError: If an invalid token is encountered in the expression.
    Example:
        >>> evalPostfix(['2', '3', '+', '4', '*'])
        20.0
    """
    s = Stack()
    for token in expr :
        if token in "+-*/" :
            val2 = s.pop()
            val1 = s.pop()
            if (token == '+'): s.push(val1 + val2)
            elif (token == '-'): s.push(val1 - val2)
            elif (token == '*'): s.push(val1 * val2)
            elif (token == '/'): s.push(val1 / val2)
        else :
            s.push( float(token) )

    return s.pop()

result = evalPostfix(postfix_expr)
print('  계산결과: ', result)
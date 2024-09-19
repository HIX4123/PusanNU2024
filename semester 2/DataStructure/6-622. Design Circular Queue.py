class CircularQueue:
    """
    CircularQueue is a class that implements a circular queue data structure.
    
    Methods:
    --------
        __init__(k: int):
        enQueue(value: int):
        deQueue():
        Rear() -> int:
        Front() -> int:
        _emptyCheck():
        _fullCheck():
    """
    def __init__(self, k: int):
        """
        Initializes a new instance of the circular queue with a specified capacity.

        Args:
            k (int): The maximum number of elements that the circular queue can hold.

        Attributes:
            _data (list): Internal list to store queue elements.
            _rearIdx (int): Index of the rear element in the queue.
            _frntIdx (int): Index of the front element in the queue.
            _size (int): Current number of elements in the queue.
        """
        self._data = [None] * k
        self._rearIdx = -1
        self._frntIdx = 0
        self._size = 0

    def enQueue(self, value: int):
        """
        Adds an element to the rear of the circular queue.
        Args:
            value (int): The value to be added to the queue.
        Raises:
            OverflowError: If the queue is full.
        """
        self._fullCheck()

        self._rearIdx += 1
        self._rearIdx = self._rearIdx % len(self._data)
        self._data[self._rearIdx] = value
        self._size += 1

    def deQueue(self):
        """
        Removes and returns the front element from the circular queue.
        This method updates the front index and decreases the size of the queue.
        It ensures the front index wraps around using modulo operation with the 
        length of the underlying data structure.
        Raises:
            IndexError: If the queue is empty.
        """
        self._emptyCheck()

        self._frntIdx += 1
        self._frntIdx = self._frntIdx % len(self._data)
        self._size -= 1

    def Rear(self) -> int:
        """
        Returns the element at the rear of the circular queue.

        This method first checks if the queue is empty by calling the `_emptyCheck` method.
        If the queue is not empty, it returns the element located at the rear index of the queue.

        Returns:
            int: The element at the rear of the circular queue.

        Raises:
            Exception: If the queue is empty.
        """
        self._emptyCheck()
        return self._data[self._rearIdx]

    def Front(self) -> int:
        """
        Returns the front element of the circular queue.

        This method checks if the queue is empty and raises an exception if it is.
        If the queue is not empty, it returns the element at the front index.

        Returns:
            int: The front element of the circular queue.

        Raises:
            Exception: If the queue is empty.
        """
        self._emptyCheck()
        return self._data[self._frntIdx]

    def _emptyCheck(self):
        """
        Checks if the queue is empty.

        Raises:
            RuntimeError: If the queue is empty.
        """
        if self._size == 0:
            raise RuntimeError('Queue is Empty')

    def _fullCheck(self):
        """
        Checks if the circular queue is full.

        Raises:
            RuntimeError: If the queue is full.
        """
        cap = len(self._data)
        if self._size == cap:
            raise RuntimeError('Queue is full')


circularQ = CircularQueue(4)
circularQ.enQueue(1)
circularQ.enQueue(3)
circularQ.enQueue(5)
circularQ.deQueue()
print(circularQ.Front(), circularQ.Rear())
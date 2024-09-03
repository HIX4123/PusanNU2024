class CircularQueue:
    def __init__(self, k: int):
        self._data = [None] * k
        self._rearIdx = -1
        self._frntIdx = 0
        self._size = 0

    def enQueue(self, value: int):
        self._fullCheck()

        self._rearIdx += 1
        self._rearIdx = self._rearIdx % len(self._data)
        self._data[self._rearIdx] = value
        self._size += 1

    def deQueue(self):
        self._emptyCheck()

        self._frntIdx += 1
        self._frntIdx = self._frntIdx % len(self._data)
        self._size -= 1

    def Rear(self) -> int:
        self._emptyCheck()
        return self._data[self._rearIdx]

    def Front(self) -> int:
        self._emptyCheck()
        return self._data[self._frntIdx]

    def _emptyCheck(self):
        if self._size == 0:
            raise RuntimeError('Queue is Empty')

    def _fullCheck(self):
        cap = len(self._data)
        if self._size == cap:
            raise RuntimeError('Queue is full')


circularQ = CircularQueue(4)
circularQ.enQueue(1)
circularQ.enQueue(3)
circularQ.enQueue(5)
circularQ.deQueue()
print(circularQ.Front(), circularQ.Rear())
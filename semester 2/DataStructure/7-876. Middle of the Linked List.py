    from typing import List #아래 in_list: List[int]의 typing을 위해


class ListNode: #leetcode에 template에 주어진 노드 클래스, 파이참에서 이것을 사용해야 함
    """
    A class representing a node in a singly linked list.

    Attributes:
        val (int): The value stored in the node.
        next (ListNode): The reference to the next node in the linked list.
    """
    def __init__(self, x):
        """
        Initialize a new node with a given value.

        Args:
            x (int): The value to be assigned to the node.

        Attributes:
            val (int): The value of the node.
            next (ListNode): The reference to the next node in the linked list, initially set to None.
        """
        self.val = x
        self.next = None


def createList(in_list: List[int]) -> ListNode: #한방향연결리스트를 생성하는 메소드
    """
    Creates a singly linked list from a list of integers.

    Args:
        in_list (List[int]): A list of integers to create the linked list from. 
                                The list must contain at least one element.

    Returns:
        ListNode: The head node of the created singly linked list.

    Raises:
        RuntimeError: If the input list is empty.
    """
    if len(in_list) == 0:
        raise RuntimeError("in_list must have data")
    head_node = ListNode(in_list[0])
    last_node = head_node
    for idx in range(1, len(in_list)):
        node = ListNode(in_list[idx])
        last_node.next = node
        last_node = node
    return head_node


def printNodes(node: ListNode): #한방향연결리스트를 출력하기 위한 메소드
    """
    Prints the values of a singly linked list starting from the given node.

    Args:
        node (ListNode): The head node of the singly linked list.

    Returns:
        None
    """
    crnt_node = node
    while crnt_node is not None:
        print(crnt_node.val, end=' ')
        crnt_node = crnt_node.next
    print()


class MiddleNode:
    """
    A class used to find the middle node of a linked list using two different methods.
    
    Methods
    -------
    indexWay(head: ListNode) -> ListNode
        Finds the middle node by first counting the total number of nodes and then iterating to the middle node.
    fastSlow(head: ListNode) -> ListNode
        Finds the middle node using the two-pointer technique, where one pointer moves twice as fast as the other.
    """
    def indexWay(self, head: ListNode) -> ListNode:
        """
        Finds the middle node of a linked list using the index method.
        This method first counts the total number of nodes in the linked list.
        Then, it iterates to the middle node and returns it.
        Args:
            head (ListNode): The head node of the linked list.
        Returns:
            ListNode: The middle node of the linked list. If the list has an even number of nodes,
                      it returns the second of the two middle nodes.
        """
        total_count = 0
        crnt_node = head
        while crnt_node:
            total_count += 1
            crnt_node = crnt_node.next

        half_count = int(total_count / 2)

        crnt_node = head
        for idx in range(0, half_count):
            crnt_node = crnt_node.next

        return crnt_node


    def fastSlow(self, head: ListNode) -> ListNode:
        """
        Finds the middle node of a singly linked list using the fast and slow pointer technique.
        Args:
            head (ListNode): The head node of the singly linked list.
        Returns:
            ListNode: The middle node of the linked list. If there are two middle nodes, returns the second middle node.
        """
        slow_node = head
        fast_node = head

        while fast_node:
            if fast_node.next:
                slow_node = slow_node.next
                fast_node = fast_node.next.next
            else:
                break

        return slow_node


# index way
list_in = createList([1, 3, 5, 7, 9])
middle_node = MiddleNode()
middle_node = middle_node.indexWay(list_in)
printNodes(middle_node)

# fast runner & slow runner way
list_in = createList([1, 3, 5, 7, 9])
middle_node = MiddleNode()
middle_node = middle_node.fastSlow(list_in)
printNodes(middle_node)
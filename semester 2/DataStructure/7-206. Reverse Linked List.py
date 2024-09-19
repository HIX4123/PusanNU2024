from typing import List


class ListNode:
    """
    A class representing a node in a singly linked list.

    Attributes:
        val (int): The value stored in the node.
        next (ListNode or None): The reference to the next node in the linked list, or None if it is the last node.
    """
    def __init__(self, x):
        """
        Initializes a new node with a given value.

        Args:
            x: The value to be assigned to the node.

        Attributes:
            val: The value assigned to the node.
            next: Pointer to the next node in the linked list, initialized to None.
        """
        self.val = x
        self.next = None


def createList(in_list: List[int]) -> ListNode:
    """
    Creates a linked list from a list of integers.

    Args:
        in_list (List[int]): A list of integers to be converted into a linked list.

    Returns:
        ListNode: The head node of the created linked list.

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


def printNodes(node: ListNode):
    """
    Prints the values of the nodes in a linked list starting from the given node.

    Args:
        node (ListNode): The head node of the linked list.

    Returns:
        None
    """
    crnt_node = node
    while crnt_node is not None:
        print(crnt_node.val, end=' ')
        crnt_node = crnt_node.next
    print()


class ReverseList:
    """
    Class ReverseList provides two methods to reverse a singly linked list.
    """
    def iterativeWay(self, head: ListNode) -> ListNode:
        """
        Reverses a linked list iteratively.
        Args:
            head (ListNode): The head node of the linked list to be reversed.
        Returns:
            ListNode: The new head node of the reversed linked list.
        Example:
            Given the linked list: 1 -> 2 -> 3 -> None
            The function will return the reversed linked list: 3 -> 2 -> 1 -> None
        Notes:
            - If the input linked list is empty (head is None), the function returns None.
            - If the input linked list contains only one node, the function returns the same node.
        """
        if head is None:
            return head
        elif head.next is None:
            return head

        crnt_node = head.next
        prev_node = head
        head.next = None

        while crnt_node:
            tmp_next_node = crnt_node.next
            crnt_node.next = prev_node
            prev_node = crnt_node
            crnt_node = tmp_next_node

        return prev_node

    def recursiveWay(self, headLocal: ListNode) -> ListNode:
        """
        Reverses a linked list using a recursive approach.
        Args:
            headLocal (ListNode): The head node of the linked list to be reversed.
        Returns:
            ListNode: The new head node of the reversed linked list.
        The function works by recursively traversing to the end of the list,
        then reversing the pointers as the recursion unwinds.
        """
        # exit condition
        if headLocal is None:
            return headLocal
        elif headLocal.next is None:
            return headLocal

        back_head = self.recursiveWay(headLocal.next)
        headLocal.next.next = headLocal
        headLocal.next = None

        return back_head


rvs_list = ReverseList()

#head = createList([1, 3, 5, 7, 9])
#rvs_head = rvs_list.iterativeWay(head)
#printNodes(rvs_head)

headGlobal = createList([1, 3, 5, 7, 9])
rvs_head = rvs_list.recursiveWay(headGlobal)
printNodes(rvs_head)
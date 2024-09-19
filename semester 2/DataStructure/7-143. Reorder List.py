from typing import List


class ListNode:
    """
    A class used to represent a node in a singly linked list.

    Attributes
    ----------
    val : int
        The value stored in the node.
    next : ListNode or None
        The reference to the next node in the linked list, or None if there is no next node.

    Methods
    -------
    __init__(self, x)
        Initializes a ListNode with a given value and sets the next node to None.
    """

    def __init__(self, x):
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

    Prints:
        The values of the nodes in the linked list, separated by spaces.
    """
    crnt_node = node
    while crnt_node is not None:
        print(crnt_node.val, end=" ")
        crnt_node = crnt_node.next
    print()


class Reorder:
    """
    A class used to reorder a singly linked list.

    Methods
    -------
    reorderList(head: ListNode) -> ListNode:
        Reorders the given linked list in-place such that the nodes are rearranged in a specific order.
        The order is defined as follows: given a list L0 -> L1 -> L2 -> ... -> Ln-1 -> Ln,
        the reordered list should be L0 -> Ln -> L1 -> Ln-1 -> L2 -> Ln-2 -> ...

    Example
    -------
    Given the linked list: 1 -> 2 -> 3 -> 4 -> 5 -> 6
    The reordered list will be: 1 -> 6 -> 2 -> 5 -> 3 -> 4

    Parameters
    ----------
    head : ListNode
        The head node of the singly linked list to be reordered.

    Returns
    -------
    ListNode
        The head node of the reordered singly linked list.
    """

    def reorderList(self, head: ListNode) -> ListNode:
        """
        Reorders a given linked list in a specific pattern.
        The function performs the following steps:
        1. Finds the middle of the linked list.
        2. Reverses the second half of the linked list.
        3. Merges the two halves of the linked list in a specific order.
        Args:
            head (ListNode): The head node of the linked list.
        Returns:
            ListNode: The head node of the reordered linked list.
        """
        if not head:
            return

        # find the middle of linked list [Problem 876]
        # in 1->2->3->4->5->6 find 4
        slow = fast = head
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next

        # reverse the second part of the list [Problem 206]
        # convert 1->2->3->4->5->6 into 1->2->3->4 and 6->5->4
        # reverse the second half in-place
        prev_node, crnt_node = None, slow
        while crnt_node:
            tmp_next_node = crnt_node.next
            crnt_node.next = prev_node
            prev_node = crnt_node
            crnt_node = tmp_next_node

        # merge two sorted linked lists [Problem 21]
        # merge 1->2->3->4 and 6->5->4 into 1->6->2->5->3->4
        first, second = head, prev_node
        while second.next:
            first.next, first = second, first.next
            second.next, second = first, second.next

        return head


reorder = Reorder()

head = createList([1, 2, 3, 4, 5])
reorder_head = reorder.reorderList(head)
printNodes(reorder_head)

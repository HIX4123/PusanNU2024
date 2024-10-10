from typing import List


class ListNode:
    """
    A class representing a node in a singly linked list.

    Attributes:
        val (int): The value stored in the node.
        next (ListNode): The reference to the next node in the linked list.
    """
    def __init__(self, x):
        self.val = x
        self.next = None


def createList(in_list: List[int]) -> ListNode:
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
    current_node = node
    while current_node is not None:
        print(current_node.val, end=' ')
        current_node = current_node.next
    print()


class Partition:
    def partition(self, head: ListNode, x: int) -> ListNode:
        before = before_head = ListNode(-1)
        after = after_head = ListNode(-1)

        current_node = head
        while current_node:
            val = current_node.val
            if x <= val:
                after.next = current_node
                after = after.next
                current_node = current_node.next
            else:
                before.next = current_node
                before = before.next
                current_node = current_node.next

        after.next = None
        before.next = after_head.next

        return before_head.next


partitioner = Partition()

head = createList([1, 4, 3, 2, 5, 2])
partition_head = partitioner.partition(head, 3)
printNodes(partition_head)
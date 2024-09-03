from typing import List


class ListNode:
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
    crnt_node = node
    while crnt_node is not None:
        print(crnt_node.val, end=' ')
        crnt_node = crnt_node.next
    print()


class Reorder:
    def reorderList(self, head: ListNode) -> ListNode:
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
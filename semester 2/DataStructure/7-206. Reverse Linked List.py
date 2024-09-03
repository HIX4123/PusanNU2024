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


class ReverseList:
    def iterativeWay(self, head: ListNode) -> ListNode:
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
from typing import List #아래 in_list: List[int]의 typing을 위해


class ListNode: #leetcode에 template에 주어진 노드 클래스, 파이참에서 이것을 사용해야 함
    def __init__(self, x):
        self.val = x
        self.next = None


def createList(in_list: List[int]) -> ListNode: #한방향연결리스트를 생성하는 메소드
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
    crnt_node = node
    while crnt_node is not None:
        print(crnt_node.val, end=' ')
        crnt_node = crnt_node.next
    print()


class MiddleNode:
    def indexWay(self, head: ListNode) -> ListNode:
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
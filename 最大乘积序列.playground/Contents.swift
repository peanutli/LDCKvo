/**
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 
 **/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var temp = 0
        var l3 : ListNode?
        if var p = l1,var q = l2 {
            while p != nil,q != nil  {
                var num = p.val + q.val + temp
                temp = num / 10
                num = num % 10
                print(num)
                let node = ListNode(num)
                if l3 == nil {
                    l3 = node
                }
                else {
                    l3?.next = node
                }
                if p.next != nil {
                    p = p.next!
                }
                else {
                    break;
                }
                if q.next != nil {
                    q = q.next!
                }
                else {
                    break;
                }
            }
        }
        return l3
    }
    
    func outList(l:ListNode?){
        if var l1 = l {
            while l1.next != nil {
                print(l1.val)
                l1 = l1.next!
            }
        }
    }
}


let solution = Solution()

let node1 = ListNode(2)
let node2 = ListNode(4)
let node3 = ListNode(3)
node1.next = node2
node2.next = node3

let l1 = node1

let otherNode1 = ListNode(5)
let otherNode2 = ListNode(6)
let otherNode3 = ListNode(4)
otherNode1.next = otherNode2
otherNode2.next = otherNode3

let l2 = otherNode1

let l3 = solution.addTwoNumbers(l1, l2)


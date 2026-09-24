/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var stackA = [ListNode](), stackB = [ListNode]()
        var refA = headA, refB = headB
        var result: ListNode?

        while let val = refA {
            stackA.append(val)
            refA = val.next
        }
        while let val = refB {
            stackB.append(val)
            refB = val.next
        }
        while let nodeA = stackA.popLast(), let nodeB = stackB.popLast(), nodeA === nodeB {
            result = nodeA
        }

        return result
    }
}

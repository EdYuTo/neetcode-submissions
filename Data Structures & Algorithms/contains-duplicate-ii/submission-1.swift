class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int:Int](), result = false
        
        for (idx, num) in nums.enumerated() {
            if let pos = dict[num] {
                result = result || abs(pos - idx) <= k
                dict[num] = idx
            } else {
                dict[num] = idx
            }
        }
        
        return result
    }
}

class Solution {
    private func helper(
        _ nums: [Int], 
        _ cumulative: [Int], 
        _ target: Int, 
        _ total: Int
    ) -> [[Int]]? {
        guard total <= target else { return nil }

        if total == target { return [cumulative] }

        var result = [[Int]]()
        for (idx, num) in nums.enumerated() {
            if let data = helper(Array(nums.suffix(nums.count - idx)), cumulative + [num], target, total + num) { 
                result.append(contentsOf: data)
            }
        }

        return result
    }

    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        helper(nums, [Int](), target, 0) ?? [[Int]]()
    }
}

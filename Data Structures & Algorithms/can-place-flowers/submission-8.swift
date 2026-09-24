class Solution {
    private func safeValue(for index: Int, from array: [Int], default value: Int) -> Int {
        guard index >= 0, index < array.count else { return value }
        return array[index]
    }

    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var pos = 0, count = n, flowerbed = flowerbed

        guard n > 0 else { return true }

        while pos < flowerbed.count, count > 0 {
            if flowerbed[pos] == 0, 
                    safeValue(for: pos-1, from: flowerbed, default: 0) == 0, 
                    safeValue(for: pos+1, from: flowerbed, default: 0) == 0 {
                count -= 1
                pos += 1
            }
            pos += 1
        }

        return count < 1
    }
}

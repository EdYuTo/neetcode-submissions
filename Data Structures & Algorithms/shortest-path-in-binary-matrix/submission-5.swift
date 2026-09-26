class Solution {
    private struct Pos: Hashable {
        let x: Int
        let y: Int
    }

    private var grid = [[Int]]()

    private func safe(_ index: Pos) -> Int? {
        guard index.x >= 0, index.x < grid.count else { return nil }
        guard index.y >= 0, index.y < grid[index.x].count else { return nil }
        return grid[index.x][index.y]
    }

    private func neighbours(_ currentPos: Pos) -> [Pos] {
        var result = [Pos]()
        for i in -1...1 {
            for j in -1...1 {
                if i == 0, j == 0 { continue }
                result.append(Pos(x: currentPos.x + i, y: currentPos.y + j))
            }
        }
        return result
    }

    func shortestPathBinaryMatrix(_ grid: inout [[Int]]) -> Int {
        self.grid = grid
        let initialPos = Pos(x: 0, y: 0)
        let desiredPos = Pos(x: grid.count - 1, y: grid[0].count - 1)

        guard safe(initialPos) == 0, safe(desiredPos) == 0 else { return -1 }

        var visitedPos = Set<Pos>(), size = 1, queue = [initialPos], result = 1

        while !queue.isEmpty {
            size = queue.count
            while size > 0 {
                size -= 1
                let currentPos = queue.removeFirst()

                if currentPos == desiredPos { return result }

                for neighbour in neighbours(currentPos) {
                    guard safe(neighbour) == 0, !visitedPos.contains(neighbour) else { continue }
                    queue.append(neighbour)
                    visitedPos.insert(neighbour)
                }
            }
            result += 1
        }

        return -1
    }
}

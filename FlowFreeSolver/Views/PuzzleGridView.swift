import SwiftUI

struct PuzzleGridView: View {
    let puzzle: Puzzle
    let cellSize: CGFloat

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<puzzle.grid.count, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<puzzle.grid[row].count, id: \.self) { column in
                        let color = puzzle.grid[row][column]
                        let isStartOrEnd = isStartOrEndPoint(row: row, column: column)
                        let direction = pipeDirection(row: row, column: column)
                        
                        PuzzleCellView(color: color, isStartOrEnd: isStartOrEnd, pipeDirection: direction)
                            .frame(width: cellSize, height: cellSize)
                    }
                }
            }
        }
    }

    private func isStartOrEndPoint(row: Int, column: Int) -> Bool {
        for pair in puzzle.pairs {
            if (pair.startPoint.x == column && pair.startPoint.y == row) ||
               (pair.endPoint.x == column && pair.endPoint.y == row) {
                return true
            }
        }
        return false
    }

    private func pipeDirection(row: Int, column: Int) -> PipeDirection? {
        let color = puzzle.grid[row][column]
        
        // Only calculate direction if it's not a start or end point
        if isStartOrEndPoint(row: row, column: column) {
            return nil
        }
        
        if row > 0 && puzzle.grid[row - 1][column] == color {
            if column > 0 && puzzle.grid[row][column - 1] == color {
                return .bendUpLeft
            } else if column < puzzle.grid[row].count - 1 && puzzle.grid[row][column + 1] == color {
                return .bendUpRight
            } else {
                return .vertical
            }
        } else if row < puzzle.grid.count - 1 && puzzle.grid[row + 1][column] == color {
            if column > 0 && puzzle.grid[row][column - 1] == color {
                return .bendDownLeft
            } else if column < puzzle.grid[row].count - 1 && puzzle.grid[row][column + 1] == color {
                return .bendDownRight
            } else {
                return .vertical
            }
        } else if column > 0 && puzzle.grid[row][column - 1] == color {
            return .horizontal
        } else if column < puzzle.grid[row].count - 1 && puzzle.grid[row][column + 1] == color {
            return .horizontal
        }
        
        return nil
    }
}

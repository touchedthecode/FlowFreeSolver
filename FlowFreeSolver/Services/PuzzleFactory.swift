//
//  PuzzleFactory.swift
//  FlowFreeSolver
//
//  Created by Nikolaos Papandreou on 30.08.24.
//

import Foundation

class PuzzleFactory {
    static func create5x5Puzzle() -> Puzzle {
        var grid = Array(repeating: Array(repeating: FlowColor.none, count: 5), count: 5)
        let pairs = [
            Pair(color: .red, startPoint: Point(x: 0, y: 0), endPoint: Point(x: 1, y: 4)),
            Pair(color: .green, startPoint: Point(x: 1, y: 3), endPoint: Point(x: 2, y: 0)),
            Pair(color: .blue, startPoint: Point(x: 2, y: 1), endPoint: Point(x: 2, y: 4)),
            Pair(color: .orange, startPoint: Point(x: 3, y: 4), endPoint: Point(x: 4, y: 1)),
            Pair(color: .purple, startPoint: Point(x: 4, y: 0), endPoint: Point(x: 3, y: 3))
        ]

        for pair in pairs {
            grid[pair.startPoint.y][pair.startPoint.x] = pair.color
            grid[pair.endPoint.y][pair.endPoint.x] = pair.color
        }

        return Puzzle(grid: grid, pairs: pairs)
    }

    static func create7x7Puzzle() -> Puzzle {
        var grid = Array(repeating: Array(repeating: FlowColor.none, count: 7), count: 7)
        let pairs = [
            Pair(color: .red, startPoint: Point(x: 6, y: 1), endPoint: Point(x: 4, y: 5)),
            Pair(color: .green, startPoint: Point(x: 2, y: 4), endPoint: Point(x: 3, y: 3)),
            Pair(color: .blue, startPoint: Point(x: 6, y: 0), endPoint: Point(x: 5, y: 6)),
            Pair(color: .orange, startPoint: Point(x: 5, y: 1), endPoint: Point(x: 1, y: 2)),
            Pair(color: .purple, startPoint: Point(x: 4, y: 4), endPoint: Point(x: 5, y: 5)),
            Pair(color: .cyan, startPoint: Point(x: 4, y: 3), endPoint: Point(x: 6, y: 6))
        ]
        
        for pair in pairs {
            grid[pair.startPoint.y][pair.startPoint.x] = pair.color
            grid[pair.endPoint.y][pair.endPoint.x] = pair.color
        }

        return Puzzle(grid: grid, pairs: pairs)
    }

    static func create9x9Puzzle() -> Puzzle {
        var grid = Array(repeating: Array(repeating: FlowColor.none, count: 9), count: 9)
        let pairs = [
            Pair(color: .red, startPoint: Point(x: 1, y: 1), endPoint: Point(x: 4, y: 4)),
            Pair(color: .green, startPoint: Point(x: 1, y: 4), endPoint: Point(x: 3, y: 4)),
            Pair(color: .blue, startPoint: Point(x: 3, y: 1), endPoint: Point(x: 7, y: 2)),
            Pair(color: .orange, startPoint: Point(x: 4, y: 2), endPoint: Point(x: 6, y: 2)),
            Pair(color: .purple, startPoint: Point(x: 0, y: 5), endPoint: Point(x: 2, y: 6)),
            Pair(color: .magenta, startPoint: Point(x: 1, y: 5), endPoint: Point(x: 7, y: 3)),
            Pair(color: .cyan, startPoint: Point(x: 2, y: 1), endPoint: Point(x: 3, y: 2)),
            Pair(color: .yellow, startPoint: Point(x: 1, y: 7), endPoint: Point(x: 7, y: 5)),
            Pair(color: .brown, startPoint: Point(x: 1, y: 6), endPoint: Point(x: 8, y: 5))
        ]

        for pair in pairs {
            grid[pair.startPoint.y][pair.startPoint.x] = pair.color
            grid[pair.endPoint.y][pair.endPoint.x] = pair.color
        }

        return Puzzle(grid: grid, pairs: pairs)
    }
}

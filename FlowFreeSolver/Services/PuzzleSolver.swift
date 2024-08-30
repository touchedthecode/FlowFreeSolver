//
//  PuzzleSolver.swift
//  FlowFreeSolver
//
//  Created by Nikolaos Papandreou on 30.08.24.
//

import Foundation

class PuzzleSolver {
    private var puzzle: Puzzle
    private var connectedPairs: [FlowColor: Bool] = [:]

    init(puzzle: Puzzle) {
        self.puzzle = puzzle
        initializeConnectedPairs()
    }
    
    private func initializeConnectedPairs() {
        for pair in puzzle.pairs {
            connectedPairs[pair.color] = false
        }
    }

    func solvePuzzle() -> Puzzle {
        for (y, row) in puzzle.grid.enumerated() {
            for (x, pointColor) in row.enumerated() {
                
                //print("Point at x: \(x), y: \(y) is \(pointColor)")
                
                if pointColor != .none && !(connectedPairs[pointColor] ?? false) {
                    
                    let currentPair = self.puzzle.pairs.first(where: { $0.color == pointColor })!
                    
                    let possibleMovePoints = possibleMovePoints(from: Point(x: x, y: y))
                
                    // Strategy 1: If there is only one possible move, do it
                    if possibleMovePoints.count == 1 {
                        let newPoint = possibleMovePoints[0]
                        puzzle.grid[newPoint.y][newPoint.x] = pointColor
                    }
                    
                    // Strategy 2: If going one step into a direction creates a pair, do it
                    if possibleMovePoints.count > 1 {
                        for possibleMovePoint in possibleMovePoints {
                            
                            // move to point
                            puzzle.grid[possibleMovePoint.y][possibleMovePoint.x] = pointColor
                            
                            // if pair is not connected, remove the point
                            if !isPairConnected(pair: currentPair){
                                puzzle.grid[possibleMovePoint.y][possibleMovePoint.x] = .none
                            } else {
                                break // we created the pair - we can stop looking
                            }
                                                        
                        }
                    }
                                        
                    if isPairConnected(pair: currentPair) {
                        connectedPairs[pointColor] = true
                    }
                    
                }
                
            }
        }
        
        
        
        return puzzle
    }

    private func isWithinBounds(_ point: Point) -> Bool {
        return point.x >= 0 && point.x < puzzle.grid[0].count && point.y >= 0 && point.y < puzzle.grid.count
    }
    
    private func connectByEdge(from point: Point) {
        

    }

    private func possibleMovePoints(from point: Point) -> [Point] {
        var possibleMovePoints: [Point] = []
        
        for direction in Point.directions {
            let newPoint = point + direction
            
            if isWithinBounds(newPoint) && puzzle.grid[newPoint.y][newPoint.x] == .none {
                possibleMovePoints.append(newPoint)
            }
        }
        
        return possibleMovePoints
    }


    private func isPairConnected(pair: Pair) -> Bool {
        //guard let pair = puzzle.pairs.first(where: { $0.color == pair.color }) else { return false }
        
        var visited = Set<Point>()
        return dfs(from: pair.startPoint, to: pair.endPoint, visited: &visited)
    }

    private func dfs(from start: Point, to end: Point, visited: inout Set<Point>) -> Bool {
        
        // Base case: If the start point is the end point, we've found a path
        if start == end {
            return true
        }

        // Mark the current node as visited
        visited.insert(start)

        // Explore all possible directions
        for direction in Point.directions {
            let newPoint = Point(x: start.x + direction.x, y: start.y + direction.y)

            // Check if the new point is within bounds, is the same color, and hasn't been visited yet
            if isWithinBounds(newPoint), puzzle.grid[newPoint.y][newPoint.x] == puzzle.grid[start.y][start.x], !visited.contains(newPoint) {
                // Recursively perform DFS from the new point
                if dfs(from: newPoint, to: end, visited: &visited) {
                    return true
                }
            }
        }

        // If no path is found, return false
        return false
    }
}

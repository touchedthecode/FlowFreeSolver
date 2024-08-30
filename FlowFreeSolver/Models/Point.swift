//
//  Point.swift
//  FlowFreeSolver
//
//  Created by Nikolaos Papandreou on 27.08.24.
//

import Foundation

struct Point: Equatable, AdditiveArithmetic, Hashable {
    let x: Int
    let y: Int
    
    static let directions = [
        Point(x: 0, y: -1),  // Up
        Point(x: 0, y: 1),   // Down
        Point(x: -1, y: 0),  // Left
        Point(x: 1, y: 0)    // Right
    ]
    
    // Conforming to Equatable by implementing the == operator
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    // Conforming to AdditiveArithmetic
    static func +(lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func -(lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    static var zero: Point {
        return Point(x: 0, y: 0)
    }
    
    // Conforming to Hashable by implementing the hash(into:) method
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

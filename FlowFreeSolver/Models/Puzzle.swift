//
//  Puzzle.swift
//  FlowFreeSolver
//
//  Created by Nikolaos Papandreou on 27.08.24.
//

import Foundation

struct Pair {
    let color: FlowColor
    let startPoint: Point
    let endPoint: Point
}

struct Puzzle {
    var grid: [[FlowColor]]
    let pairs: [Pair]
}

//
//  PuzzleSolverViewModel.swift
//  FlowFreeSolver
//
//  Created by Nikolaos Papandreou on 27.08.24.
//

import Foundation

class PuzzleSolverViewModel: ObservableObject {
    @Published var puzzle: Puzzle
    private var solver: PuzzleSolver

    init() {
        let puzzle = PuzzleFactory.create9x9Puzzle()
        self.puzzle = puzzle
        self.solver = PuzzleSolver(puzzle: puzzle)
    }

    init(puzzle: Puzzle) {
        self.puzzle = puzzle
        self.solver = PuzzleSolver(puzzle: puzzle)
    }

    func solvePuzzle() {
        self.puzzle = solver.solvePuzzle()
    }
    
    func resetPuzzle() {
        self.puzzle = PuzzleFactory.create9x9Puzzle()
    }
}

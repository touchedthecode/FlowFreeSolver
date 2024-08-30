//
//  ContentView.swift
//  FlowFreeSolver
//
//  Created by Nikolaos Papandreou on 27.08.24.
//

import SwiftUI

extension View {
    func centerInParent() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView: View {
    @StateObject var viewModel: PuzzleSolverViewModel = PuzzleSolverViewModel()

    var body: some View {
        GeometryReader { geometry in
            // Calculate the size based on the smaller dimension (width or height)
            let gridSize = min(geometry.size.width, geometry.size.height) * 0.9 // Reduce slightly to add padding
            let cellSize = gridSize / CGFloat(viewModel.puzzle.grid.count)
            
            VStack {
                Spacer() // Add space above the grid

                PuzzleGridView(grid: viewModel.puzzle.grid, cellSize: cellSize)
                
                Spacer() // Add space below the grid

                // Solve Puzzle Button
                Button("Solve Puzzle") {
                    viewModel.solvePuzzle()  // This will trigger the puzzle-solving logic
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                // Reset Puzzle Button
                Button("Reset Puzzle") {
                    viewModel.resetPuzzle()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color.white)
            .centerInParent()  // Applying custom modifier
        }
    }
}

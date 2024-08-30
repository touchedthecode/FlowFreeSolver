//
//  PuzzleGridView.swift
//  FlowFreeSolver
//
//  Created by Nikolaos Papandreou on 27.08.24.
//

import Foundation
import SwiftUI

struct PuzzleGridView: View {
    let grid: [[FlowColor]]
    let cellSize: CGFloat

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<grid.count, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<grid[row].count, id: \.self) { column in
                        PuzzleCellView(color: grid[row][column])
                            .frame(width: cellSize, height: cellSize)
                    }
                }
            }
        }
    }
}

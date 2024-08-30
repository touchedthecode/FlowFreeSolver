//
//  PuzzleCellView.swift
//  FlowFreeSolver
//
//  Created by Nikolaos Papandreou on 27.08.24.
//

import Foundation

import SwiftUI

struct PuzzleCellView: View {
    let color: FlowColor

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray)
                .border(Color.black)

            if color != .none {
                Circle()
                    .fill(Color(color))
                    .padding(4) // Adjust padding to make the circle smaller within the cell
            }
        }
    }
}


// https://flowfree.fandom.com/wiki/List_of_colors
extension Color {
    init(_ flowColor: FlowColor) {
        switch flowColor {
        case .red: self = .red
        case .green: self = .green
        case .blue: self = .blue
        case .yellow: self = .yellow
        case .orange: self = .orange
        case .cyan: self = .cyan
        case .magenta: self = Color(red: 234/255.0, green: 51/255.0, blue: 247/255.0)
        case .brown: self = .brown
        case .purple: self = .purple
        case .white: self = .white
        case .gray: self = .gray
        case .lime: self = Color(red: 117/255.0, green: 251/255.0, blue: 76/255.0)
        case .beige: self = Color(red: 186/255.0, green: 181/255.0, blue: 116/255.0)
        case .navy: self = Color(red: 0.0, green: 0.0, blue: 133/255.0)
        case .teal: self = .teal
        case .pink: self = .pink
        case .none: self = .clear
        }
    }
}

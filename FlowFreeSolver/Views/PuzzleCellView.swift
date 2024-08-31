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
    let isStartOrEnd: Bool
    let pipeDirection: PipeDirection?

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .border(Color.gray)

            if isStartOrEnd && color != .none {
                Circle()
                    .fill(Color(color))
                    .padding(4) // Adjust padding to make the circle smaller within the cell
            } else if let pipeDirection = pipeDirection, color != .none {
                PipeView(color: color, direction: pipeDirection)
            }
        }
    }
}

struct PipeView: View {
    let color: FlowColor
    let direction: PipeDirection

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let rect = geometry.frame(in: .local)
                switch direction {
                case .horizontal:
                    path.move(to: CGPoint(x: 0, y: rect.midY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
                case .vertical:
                    path.move(to: CGPoint(x: rect.midX, y: 0))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
                case .bendUpRight:
                    path.move(to: CGPoint(x: rect.midX, y: 0)) // From top center
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.midY)) // Down to center
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY)) // Right to right center
                case .bendUpLeft:
                    path.move(to: CGPoint(x: rect.midX, y: 0)) // From top center
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.midY)) // Down to center
                    path.addLine(to: CGPoint(x: 0, y: rect.midY)) // Left to left center
                case .bendDownRight:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY)) // From bottom center
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.midY)) // Up to center
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY)) // Right to right center
                case .bendDownLeft:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY)) // From bottom center
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.midY)) // Up to center
                    path.addLine(to: CGPoint(x: 0, y: rect.midY)) // Left to left center
                }
            }
            .stroke(Color(color), lineWidth: 8)
        }
    }
}
enum PipeDirection {
    case horizontal
    case vertical
    case bendUpRight // Bend from up to right (└)
    case bendUpLeft  // Bend from up to left (┘)
    case bendDownRight // Bend from down to right (┌)
    case bendDownLeft  // Bend from down to left (┐)
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

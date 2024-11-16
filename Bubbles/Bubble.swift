//
//  Bubble.swift
//  Bubbles
//
//  Created by Marcelo Sampaio on 16/11/24.
//
import Foundation

struct Bubble: Identifiable {
    let id = UUID()
    var size: CGFloat
    var positionX: CGFloat
    var positionY: CGFloat
    var speed: Double
    var opacity: Double
}

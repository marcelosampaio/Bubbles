//
//  ContentViewModel.swift
//  Bubbles
//
//  Created by Marcelo Sampaio on 16/11/24.
//
import Foundation
import SwiftUICore

class ContentViewModel: ObservableObject {
    @Published var bubbles: [Bubble] = []
    private var screen: Screen = .init(width: .zero, height: .zero)
    
    func setScreenSize(width: CGFloat, height: CGFloat) {
        screen = Screen(width: width, height: height)
        createBubbles()
    }
    
    private func createBubbles() {
        let numberOfBubbles = 300
        bubbles = (0..<numberOfBubbles).map { _ in
            Bubble(
                size: CGFloat.random(in: 5...10),
                positionX: CGFloat.random(in: 0...screen.width),
                positionY: CGFloat.random(in: screen.height...screen.height + 200),
                speed: Double.random(in: 3...6),
                opacity: Double.random(in: 0.3...1.0)
            )
        }
        animateBubbles()
    }
    
    private func animateBubbles() {
        for index in bubbles.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0...2)) {
                withAnimation(Animation.easeOut(duration: self.bubbles[index].speed).repeatForever(autoreverses: false)) {
                    self.bubbles[index].positionY = -100 // Move bubbles out of view
                }
            }
        }
    }
}

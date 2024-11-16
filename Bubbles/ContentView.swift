//
//  ContentView.swift
//  Bubbles
//
//  Created by Marcelo Sampaio on 16/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(viewModel.bubbles) { bubble in
                    Circle()
                        .frame(width: bubble.size, height: bubble.size)
                        .position(x: bubble.positionX, y: bubble.positionY)
                        .opacity(bubble.opacity)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                viewModel.setScreenSize(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

#Preview {
    ContentView()
}

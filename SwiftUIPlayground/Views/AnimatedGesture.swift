//
//  AnimatedGesture.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/24/20.
//

import SwiftUI

//our awesome guide:
//https://www.hackingwithswift.com/books/ios-swiftui/animating-gestures
struct AnimatedGesture: View {
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
            DraggableCard()
            
            DraggableText()
        }
    }
}

struct DraggableCard: View {
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            
            //this is it for the gesture
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount = $0.translation }
                    .onEnded { _ in self.dragAmount = .zero }
            )
            
            //some extra animation for a smoother drag
            .animation(.spring())
    }
}

struct DraggableText: View {
    
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }
        )
    }
}

struct AnimatedGesture_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedGesture()
    }
}

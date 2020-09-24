//
//  ExplicitAnimationDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/24/20.
//

import SwiftUI

//guide: https://www.hackingwithswift.com/books/ios-swiftui/creating-explicit-animations
struct ExplicitAnimationDemo: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            //THIS!!!
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
    }
}

struct ExplicitAnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimationDemo()
    }
}

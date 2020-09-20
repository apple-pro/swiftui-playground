//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/17/20.
//

import SwiftUI

struct SimpleAnimationDemo: View {
    
    @State var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Test") {
            if animationAmount < 2 {
                animationAmount += 4
            } else {
                animationAmount = 1
            }
            
        }.padding()
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .scaleEffect(animationAmount).animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAnimationDemo()
    }
}

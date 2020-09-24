//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/17/20.
//

import SwiftUI

extension Animation: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(1)
    }
}

struct SimpleAnimationDemo: View {
    
    @State var animationType: Animation = Animation.default
    @State var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            VStack {
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
                .scaleEffect(animationAmount)
                .animation(animationType)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Picker("Gender Identity", selection: $animationType) {
                Text("Default").tag(Animation.default)
                Text("Spring").tag(Animation.interpolatingSpring(stiffness: 50, damping: 1))
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAnimationDemo()
    }
}

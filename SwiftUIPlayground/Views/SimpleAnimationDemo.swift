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
    @State var delay: Double = 1
    @State var damping: Double = 0.5
    @State var stiffness: Double = 0.5
    @State var duration: Double = 5
    @State var mass: Double = 0.5
    @State var initialVelocity: Double = 0.5
    
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
            
            Form {
                Section(header: Text("Spring")) {
                    Stepper("Mass (\(mass))", value: $mass, in: 0...1, step: 0.1)
                    Stepper("Stiffness (\(stiffness))", value: $stiffness, in: 0...1, step: 1)
                    Stepper("Damping (\(damping))", value: $damping, in: 0...1, step: 0.5)
                    Stepper("Initial Velocity (\(initialVelocity))", value: $initialVelocity, in: 0...1, step: 0.1)
                }
                
                Section(header: Text("Ease In/Out")) {
                    Stepper("Delay (\(delay))", value: $delay, in: 0...3, step: 0.5)
                    Stepper("Duration (\(duration))", value: $duration, in: 0...3, step: 0.5)
                }
            }
            
            Picker("Animation Type", selection: $animationType) {
                Text("Default").tag(Animation.default)
                
                Text("Spring").tag(Animation.interpolatingSpring(
                                    mass: mass,
                                    stiffness: stiffness,
                                    damping: damping,
                                    initialVelocity: initialVelocity))
                
                Text("Ease In/Out").tag(Animation.easeInOut(duration: duration).delay(delay))
            }
            .pickerStyle(SegmentedPickerStyle())
        }.padding()
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAnimationDemo()
    }
}

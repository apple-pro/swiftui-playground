//
//  MetalPerformanceDGDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 10/4/20.
//

import SwiftUI

struct MetalPerformanceDGDemo: View {
    
    @State private var colorCycle = 0.0
    @State private var optimized = false
    
    var body: some View {
        VStack {
            if optimized {
                ColorCyclingCircle(amount: self.colorCycle)
                    .drawingGroup()
                    .frame(width: 300, height: 300)
            } else {
                ColorCyclingCircle(amount: self.colorCycle)
                    .frame(width: 300, height: 300)
            }
            
            Form {
                Slider(value: $colorCycle)
                
                Section(header: Text("Optimization")) {
                    Toggle("Drawing Group Enabled? \(optimized ? "YES": "NO")", isOn: $optimized)
                    
                    Text("Important: The drawingGroup() modifier is helpful to know about and to keep in your arsenal as a way to solve performance problems when you hit them, but you should not use it that often. Adding the off-screen render pass might slow down SwiftUI for simple drawing, so you should wait until you have an actual performance problem before trying to bring in drawingGroup().")
                }
            }
            
        }
    }
}

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct MetalPerformanceDGDemo_Previews: PreviewProvider {
    static var previews: some View {
        MetalPerformanceDGDemo()
    }
}

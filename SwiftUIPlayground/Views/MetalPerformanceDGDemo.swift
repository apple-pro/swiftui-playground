//
//  MetalPerformanceDGDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 10/4/20.
//

import SwiftUI

struct MetalPerformanceDGDemo: View {
    
    @State private var colorCycle = 0.0

        var body: some View {
            VStack {
                ColorCyclingCircle(amount: self.colorCycle)
                    .frame(width: 300, height: 300)

                Slider(value: $colorCycle)
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
                    .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 2)
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

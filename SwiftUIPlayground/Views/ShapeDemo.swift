//
//  ShapeDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 10/3/20.
//

import SwiftUI

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAdjustment
            let modifiedEnd = endAngle - rotationAdjustment

            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

            return path
    }
}

//shape: the better path
//dynamic and reusable
struct ShapeDemo: View {
    
    @State var fill = 0.2
    
    var body: some View {
        VStack {
            Arc(startAngle: .degrees(0), endAngle: .degrees(360*fill), clockwise: true)
                .stroke(Color.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
            
            Button("Add") {
                fill += 0.1
            }.disabled(fill >= 1.0)
        }
    }
}

struct ShapeDemo_Previews: PreviewProvider {
    static var previews: some View {
        ShapeDemo()
    }
}

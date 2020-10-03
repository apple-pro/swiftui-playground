//
//  PathDrawingDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 10/3/20.
//

import SwiftUI

struct PathDrawingDemo: View {
    
    let startX = 200
    let startY = 100
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: startX, y: startY))
            path.addLine(to: CGPoint(x: startY, y: startX+100))
            path.addLine(to: CGPoint(x: startX+100, y: startX+100))
            path.addLine(to: CGPoint(x: startX, y: startY))
            path.addLine(to: CGPoint(x: startX, y: startY+100))
            path.addLine(to: CGPoint(x: startY, y: startY+100))
        }
        .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        .animation(.easeIn)
    }
}

struct PathDrawingDemo_Previews: PreviewProvider {
    static var previews: some View {
        PathDrawingDemo()
    }
}

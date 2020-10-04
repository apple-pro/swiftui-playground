//
//  AnimatablePair.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 10/4/20.
//

import SwiftUI

//animating shapes with more than 1 property
struct AnimatablePairDemo: View {
    
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    if rows == 4 {
                        rows = 8
                        columns = 16
                    } else {
                        rows = 4
                        columns = 4
                    }
                }
            }
    }
    
}

struct Checkerboard: Shape {
    
    var rows: Int
    var columns: Int
    
    //As with simpler shapes, the solution here is to implement an animatableData property that will be set with intermediate values as the animation progresses. Here, though, there are two catches:

    // (1) We have two properties that we want to animate, not one.
    // (2) Our row and column properties are integers, and SwiftUI can’t interpolate integers.
    
    //To resolve the first problem we’re going to use a new type called AnimatablePair. As its name suggests, this contains a pair of animatable values, and because both its values can be animated the AnimatablePair can itself be animated. We can read individual values from the pair using .first and .second.

    //To resolve the second problem we’re just going to do some type conversion: we can convert a Double to an Int just by using Int(someDouble), and go the other way by using Double(someInt).
    public var animatableData: AnimatablePair<Double, Double> {
        get {
           AnimatablePair(Double(rows), Double(columns))
        }

        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // figure out how big each row/column needs to be
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        // loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}

struct AnimatablePair_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePairDemo()
    }
}

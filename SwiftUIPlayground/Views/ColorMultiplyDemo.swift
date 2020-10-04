//
//  ColorMultiplyDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 10/4/20.
//

import SwiftUI

struct ColorMultiplyDemo: View {
    var body: some View {
        ZStack {
//            Image("SpongeBob")
//
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.multiply)
            
            Image("SpongeBob")
                .colorMultiply(.yellow)
                
        }
        .frame(width: 400, height: 500)
        .clipped()
    }
}

struct ColorMultiplyDemo_Previews: PreviewProvider {
    static var previews: some View {
        ColorMultiplyDemo()
    }
}

//
//  AnimatedGesture.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/24/20.
//

import SwiftUI

struct AnimatedGesture: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
    }
}

struct AnimatedGesture_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedGesture()
    }
}

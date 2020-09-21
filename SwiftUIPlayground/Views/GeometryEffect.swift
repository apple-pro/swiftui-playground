//
//  GeometryEffect.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/21/20.
//

import SwiftUI

struct GeometryEffect: View {
    
    @State private var isFlipped = false
    
    var body: some View {
        VStack {
            if isFlipped {
                Circle().background(Color.red)
                Circle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            } else {
                Circle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Circle().background(Color.red)
            }
        }.onTapGesture(count: 2) {
            withAnimation {
                self.isFlipped.toggle()
            }
        }
    }
}

struct GeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        GeometryEffect()
    }
}

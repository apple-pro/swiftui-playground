//
//  GeometryEffect.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/21/20.
//

import SwiftUI

struct GeometryEffect: View {
    
    @Namespace private var animation
    @State private var isFlipped = false
    
    //really cool animation effect where you can hint at ios
    //which views are one and the same
    //resultin in a seamless animation especially when views
    //need to shift their position
    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .background(Color.red)
                    .matchedGeometryEffect(id: "BlackCircle", in: animation)
                
                Circle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .matchedGeometryEffect(id: "BlueCircle", in: animation)
            } else {
                Circle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .matchedGeometryEffect(id: "BlueCircle", in: animation)
                    
                
                Circle()
                    .background(Color.red)
                    .matchedGeometryEffect(id: "BlackCircle", in: animation)
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

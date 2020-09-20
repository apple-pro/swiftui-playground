//
//  AnimationEaseOut.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/20/20.
//

import SwiftUI

struct AnimationEaseOut: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
            
            VStack {
                Text("Hello")
                Text("Hello")
            }
            .background(Color.gray)
            
            
            Button("Start") {
                
            }
            
        }.frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct AnimationEaseOut_Previews: PreviewProvider {
    static var previews: some View {
        AnimationEaseOut()
    }
}

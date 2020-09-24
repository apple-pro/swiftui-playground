//
//  TransitionDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/24/20.
//

import SwiftUI

struct TransitionDemo: View {
    
    @State var isHidden = false
    
    var body: some View {
        VStack {
            Button(isHidden ? "Show" : "Hide") {
                withAnimation {
                    isHidden.toggle()
                }
            }
            
            if !isHidden {
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 200, height: 200)
            }
            
        }
    }
}

struct TransitionDemo_Previews: PreviewProvider {
    static var previews: some View {
        TransitionDemo()
    }
}

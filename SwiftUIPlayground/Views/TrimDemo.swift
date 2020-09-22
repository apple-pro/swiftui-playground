//
//  TrimDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/22/20.
//

import SwiftUI

struct TrimDemo: View {
    @State private var completionAmount: CGFloat = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.5)
                .frame(width: 200, height: 200)
            
            Spacer()
            
            Circle()
                .trim(from: 0, to: completionAmount)
                .stroke(Color.red, lineWidth: 20)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .onReceive(timer) { _ in
                    withAnimation {
                        guard self.completionAmount < 1 else { return }
                        self.completionAmount += 0.2
                    }
                }
            
        }.padding()
        
    }
}

struct TrimDemo_Previews: PreviewProvider {
    static var previews: some View {
        TrimDemo()
    }
}

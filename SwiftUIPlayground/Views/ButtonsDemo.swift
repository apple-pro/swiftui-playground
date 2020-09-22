//
//  ButtonsDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/22/20.
//

import SwiftUI

struct ButtonsDemo: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            Button("Simple Button") {}
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
            
            Spacer()
            
            Button(action: {}) {
                HStack(spacing: 10) {
                    Image(systemName: "pencil")
                    Text("Edit")
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            
            Spacer()
            
            Button(action: {}) {
                HStack(spacing: 10) {
                    Image("apple").resizable().frame(width: 25, height: 25)
                        Text("Edit")
                    }
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            
            
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .padding()
        .background(Color.gray)
        .ignoresSafeArea(.all)
    }
}

struct ButtonsDemo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsDemo()
    }
}

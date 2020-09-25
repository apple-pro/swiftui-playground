//
//  ImageDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/25/20.
//

import SwiftUI

struct ImageDemo: View {
    
    @State var contentMode: Int = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            if contentMode == 2 {
                Image("moonLarge")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipped()
                    .background(Color.red)
                    .padding()
                    .background(Color.blue)
            } else {
                Image("moonLarge")
                    .resizable()
                    .aspectRatio(contentMode: contentMode == 1 ? .fill : .fit)
                    .frame(width: 300, height: 300)
                    .clipped()
                    .background(Color.red)
                    .padding()
                    .background(Color.blue)
            }
            
            Spacer()
            
            Picker("Gender Identity", selection: $contentMode) {
                Text("Fit").tag(0)
                Text("Fill").tag(1)
                Text("None").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
        .ignoresSafeArea()
    }
    
}

struct ImageDemo_Previews: PreviewProvider {
    static var previews: some View {
        ImageDemo()
    }
}

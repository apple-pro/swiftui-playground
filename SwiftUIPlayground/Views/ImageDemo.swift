//
//  ImageDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/25/20.
//

import SwiftUI

struct ImageDemo: View {
    
    @State var contentMode: ContentMode = .fit
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("moonLarge")
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .frame(width: 300, height: 300)
                .clipped()
                .background(Color.red)
                .padding()
                .background(Color.blue)
            
            Spacer()
            
            Picker("Gender Identity", selection: $contentMode) {
                Text("Fit").tag(ContentMode.fit)
                Text("Fill").tag(ContentMode.fill)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
    }
}

struct ImageDemo_Previews: PreviewProvider {
    static var previews: some View {
        ImageDemo()
    }
}

//
//  GradientDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/22/20.
//

import SwiftUI

struct GradientDemo: View {
    
    @State var start: UnitPoint = .top
    
    var body: some View {
        VStack {
            
            VStack {
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: start, endPoint: .bottom))
            
            Picker("", selection: $start) {
                Text("Top Leading").tag(UnitPoint.topLeading)
                Text("Top Center").tag(UnitPoint.top)
                Text("Top Trailing").tag(UnitPoint.topTrailing)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }.padding()
        
    }
}

struct GradientDemo_Previews: PreviewProvider {
    static var previews: some View {
        GradientDemo()
    }
}

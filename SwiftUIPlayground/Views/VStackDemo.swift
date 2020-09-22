//
//  VStackDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/22/20.
//

import SwiftUI

extension HorizontalAlignment: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(1)
    }
}

struct VStackDemo: View {
    
    @State var alignment: HorizontalAlignment = .trailing
    
    var body: some View {
        VStack {
            VStack(alignment: alignment) {
                Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .foregroundColor(.red)
                
                Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .foregroundColor(.blue)
            }
            .frame(width: 1000, height: 1000)
            .background(Color.gray)
            
            
            Text("Is Center? \(alignment == .center ? "Yes" : "No")")
            
            Picker("Gender Identity", selection: $alignment) {
                Text("Trailing").tag(HorizontalAlignment.trailing)
                Text("Center").tag(HorizontalAlignment.center)
                Text("Leading").tag(HorizontalAlignment.leading)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
    
}

struct VStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        VStackDemo()
    }
}

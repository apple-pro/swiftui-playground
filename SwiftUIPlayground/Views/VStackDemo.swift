//
//  VStackDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/22/20.
//

import SwiftUI

extension Alignment: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(1)
    }
}

struct VStackDemo: View {
    
    @Namespace var animation
    @State var alignment: Alignment = .center
    
    var body: some View {
        VStack {
            VStack {
                Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .foregroundColor(.red)
                    .matchedGeometryEffect(id: "red", in: animation)
                
                Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .foregroundColor(.green)
                    .matchedGeometryEffect(id: "green", in: animation)
                
                Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .foregroundColor(.blue)
                    .matchedGeometryEffect(id: "blue", in: animation)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: alignment)
            .background(Color.gray)
            .animation(.default)
            
            Picker("", selection: $alignment) {
                Text("Top Leading").tag(Alignment.topLeading)
                Text("Center").tag(Alignment.top)
                Text("Top Trailing").tag(Alignment.topTrailing)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("", selection: $alignment) {
                Text("Leading").tag(Alignment.leading)
                Text("Center").tag(Alignment.center)
                Text("Trailing").tag(Alignment.trailing)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("", selection: $alignment) {
                Text("Bot Leading").tag(Alignment.bottomLeading)
                Text("Center").tag(Alignment.bottom)
                Text("Bot Trailing").tag(Alignment.bottomTrailing)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
    }
    
}

struct VStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        VStackDemo()
    }
}

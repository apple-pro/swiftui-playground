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
                Circle().foregroundColor(.red).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                Circle().foregroundColor(.blue).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            }
            .frame(width: 1000, height: 1000)
            .background(Color.gray)
            
            
            Picker("Gender Identity", selection: $alignment) {
                Text("Trailing").tag(HorizontalAlignment.trailing)
                Text("Center").tag(HorizontalAlignment.center)
                Text("Leading").tag(HorizontalAlignment.leading)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
    
    func alignment(value: Int) -> HorizontalAlignment {
        switch value {
        case 1:
            return .leading
        case 2:
            return .trailing
        default:
            return .center
        }
        
    }
    
}

struct VStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        VStackDemo()
    }
}

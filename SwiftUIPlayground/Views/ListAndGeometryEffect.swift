//
//  ListAndGeometryEffect.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 10/3/20.
//

import SwiftUI

struct ListAndGeometryEffect: View {
    
    @Namespace private var namespace
    
    @State var list1 = ["A", "B", "C"]
    @State var list2 = ["D", "E", "F"]
    
    var body: some View {
        VStack {
            MyList(listName: "List 1", namespace: namespace, theList: $list1)
            MyList(listName: "List 2", namespace: namespace, theList: $list2)
        }.onTapGesture {
            list1.append("D")
            list2.remove(at: 0)
        }
    }
}

struct MyList: View {
    
    var listName: String
    var namespace: Namespace.ID
    @Binding var theList: [String]
    
    var body: some View {
        VStack {
            Text(listName)
            List(theList, id: \.self) {
                Text("Item: \($0)")
                    .padding()
                    .border(Color.red)
                    .matchedGeometryEffect(id: $0, in: namespace)
            }
        }
        
    }
}


struct ListAndGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        ListAndGeometryEffect()
    }
}

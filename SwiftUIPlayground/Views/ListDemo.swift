//
//  ListDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/23/20.
//

import SwiftUI

//list are awesome
//https://www.hackingwithswift.com/books/ios-swiftui/introducing-list-your-best-friend
struct ListDemo: View {
    
    @State var listType = 0
    
    var body: some View {
        VStack {
            
            if listType == 0 {
                BasicList()
            } else if (listType == 1) {
                SimpleDynamicList()
            } else {
                ComplexDynamicList()
            }
            
            Picker("Gender Identity", selection: $listType) {
                Text("Basic").tag(0)
                Text("Dynamic").tag(1)
                Text("Struct").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct BasicList: View {
    
    var body: some View {
        List {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Hello, World!")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SimpleDynamicList: View {
    
    var names = ["Kraken", "Barnacle", "Goodfried"]
    
    var body: some View {
        List(names, id: \.self) {
            Text("Hello: \($0)")
        }
    }
}

struct ComplexDynamicList: View {
    
    var humans = [
        Human("Barto", "Crew"),
        Human("Saya", "Gunner"),
        Human("Hikari", "Gunner")
    ]
    
    var body: some View {
        List(humans, id: \.name) {
            Text("\($0.name): \($0.job)")
        }
    }
}

struct Human {
    let name: String
    let job: String
    
    init(_ name: String, _ job: String) {
        self.name = name
        self.job = job
    }
}

struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemo()
    }
}

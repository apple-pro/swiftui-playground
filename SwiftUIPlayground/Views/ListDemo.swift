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
    
    @State var listType = 2
    
    var body: some View {
        VStack {
            
            if listType == 0 {
                BasicList()
            } else if (listType == 1) {
                SimpleDynamicList()
            } else if (listType == 2) {
                GroupedComplexDynamicList()
            } else {
                ComplexDynamicList()
            }
            
            Picker("Gender Identity", selection: $listType) {
                Text("Basic").tag(0)
                Text("Dynamic").tag(1)
                Text("Grouped").tag(2)
                Text("Struct").tag(4)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct BasicList: View {
    
    var body: some View {
        List {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .listRowBackground(Color.blue)
            
            Text("Hello, World!")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            ForEach(1..<3) {
                Text("Simple Loop: \($0)")
                    .listRowBackground(Color.pink.opacity(0.5))
            }
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
        List(humans, id: \.name) { human in
            Image(systemName: "pencil")
            VStack {
                Text("\(human.name)").font(.title)
                Text("\(human.job)").font(.caption)
            }
        }.listStyle(InsetGroupedListStyle())
    }
}

struct GroupedComplexDynamicList: View {
    
    var stregas = [
        Human("Julis Reissfeld", "Swordsman"),
        Human("Katie Uniacke", "Gunner"),
        Human("Haruka Amagiri", "Swordsman")
    ]
    
    var dantes = [
        Human("Cedric Gunnell", "Swordsman"),
        Human("Silas Norman", "Gunner"),
        Human("Wernher", "Swordsman")
    ]
    
    var body: some View {
        List {
            Section(header: Text("Stregas"), footer: Text("Female Genestella")) {
                ForEach(stregas, id: \.name) { human in
                    HStack {
                        Image(systemName: "person")
                        VStack {
                            Text("\(human.name)").font(.title)
                            Text("\(human.job)").font(.caption)
                        }
                    }
                }
            }
            
            Section(header: Text("Dantes"), footer: Text("Male Genestella")) {
                ForEach(dantes, id: \.name) { human in
                    HStack {
                        Image(systemName: "person.fill")
                        VStack {
                            Text("\(human.name)").font(.title)
                            Text("\(human.job)").font(.caption)
                        }
                    }
                }
            }
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

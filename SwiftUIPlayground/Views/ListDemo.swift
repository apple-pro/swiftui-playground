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
    
    @State var listType = 100
    
    var body: some View {
        VStack {
            
            if listType == 0 {
                BasicList()
            } else if (listType == 1) {
                SimpleDynamicList()
            } else if (listType == 2) {
                GroupedComplexDynamicList()
            } else if (listType == 3) {
                ListWithChild()
            } else {
                ComplexDynamicList()
            }
            
            Picker("Gender Identity", selection: $listType) {
                Text("Basic").tag(0)
                Text("Dynamic").tag(1)
                Text("Grouped").tag(2)
                Text("Children").tag(3)
                Text("Struct").tag(100)
            }
            .pickerStyle(SegmentedPickerStyle())
        }.navigationBarTitle("Lists are Awesome").padding()
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

struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?

    // some example websites
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    // some example groups
    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}

struct ListWithChild: View {
    let items: [Bookmark] = [.example1, .example2, .example3]

    var body: some View {
        List(items, children: \.items) { row in
            Image(systemName: row.icon)
            Text(row.name)
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

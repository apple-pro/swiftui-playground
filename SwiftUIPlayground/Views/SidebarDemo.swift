//
//  SidebarDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/20/20.
//

import SwiftUI

struct SidebarDemo: View {
    var body: some View {
        NavigationView {
            SideBarView()
            PrimaryView()
            GridsDemo()
        }
    }
}

struct SideBarView: View {
    var body: some View {
        List(1..<100) { i in
            Text("S\(i)")
        }.listStyle(SidebarListStyle())
    }
}

struct PrimaryView: View {
    var body: some View {
        List(1..<100) { i in
            Text("S\(i)")
        }
    }
}

struct SidebarDemo_Previews: PreviewProvider {
    static var previews: some View {
        SidebarDemo()
    }
}

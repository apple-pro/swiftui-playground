//
//  TabDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/20/20.
//

import SwiftUI


struct TabDemo: View {
    var body: some View {
        TabView {
            Text("View 1").tabItem {
                Image(systemName: "star")
                Text("View 1")
            }
            
            Text("View 2").tabItem {
                Image(systemName: "star.fill")
                Text("View 2")
            }
        }
    }
}

struct TabDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabDemo()
    }
}

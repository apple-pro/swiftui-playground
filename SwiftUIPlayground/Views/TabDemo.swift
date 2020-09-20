//
//  TabDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/20/20.
//

import SwiftUI


struct TabDemo: View {
    
    @State private var activeTab = 2
    
    var body: some View {
        
        TabView(selection: $activeTab) {
            Text("View 1")
                .onTapGesture(count: 2) {
                    switchTabs()
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("View 1")
                }
                .tag(1)
            
            Text("View 2")
                .onTapGesture(count: 2) {
                    switchTabs()
                }
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("View 2")
                }
                .tag(2)
        }
    }
    
    func switchTabs() {
        activeTab = activeTab == 2 ? 1 : 2
    }
}

struct TabDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabDemo()
    }
}

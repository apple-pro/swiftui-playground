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
                .navigationBarTitle("Sidebar")
                .navigationBarItems(trailing: Button("Edit") {
                
                })
            PrimaryView().navigationBarTitle("Primary Content")
            GridsDemo()
        }
    }
}

struct SideBarView: View {
    var body: some View {
        List {
            NavigationLink(
                destination: PrimaryView(),
                label: {
                    HStack {
                        Image(systemName: "star")
                        Text("Favorites")
                    }
            })
            
            Section(header: Text("Animations")) {
                NavigationLink(
                    destination: SimpleAnimationDemo(),
                    label: {
                        HStack {
                            Image(systemName: "ant.circle")
                            Text("Grow and Shrink")
                        }
                })
                
                NavigationLink(
                    destination: SimpleAnimationDemo(),
                    label: {
                        HStack {
                            Image(systemName: "flame")
                            Text("Crash and Burn")
                        }
                })
            }
            
        }.listStyle(SidebarListStyle())
    }
}

struct PrimaryView: View {
    var body: some View {
        
        List {
            NavigationLink(
                destination: MapsDemo(),
                label: {
                    HStack {
                        Image(systemName: "map.fill")
                        Text("Maps")
                    }
                    
                }
            )
            
            NavigationLink(
                destination: GridsDemo(),
                label: {
                    Image(systemName: "square.grid.4x3.fill")
                    Text("Grids")
                }
            )
            
        }
    }
}

struct SidebarDemo_Previews: PreviewProvider {
    static var previews: some View {
        SidebarDemo()
    }
}

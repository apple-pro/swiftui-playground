//
//  SidebarDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/20/20.
//

import SwiftUI

struct MainNavigation: View {
    var body: some View {
        NavigationView {
            SideBarView()
                .navigationBarTitle("Sidebar")
                .navigationBarItems(trailing: Button("Edit") {
                
                })
            PrimaryView().navigationBarTitle("Primary Content")
            AlertDemo()
        }.accentColor(Color("AccentColor")) //adjusting the accent color for the entire view:
        //https://www.hackingwithswift.com/quick-start/swiftui/how-to-adjust-the-accent-color-of-a-view
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
                    destination: GeometryEffect(),
                    label: { NavItem("Geometry Effect", "wand.and.rays")}
                )
                
                NavigationLink(
                    destination: AnimationEaseOut(),
                    label: {
                        HStack {
                            Image(systemName: "flame")
                            Text("Crash and Burn")
                        }
                })
            }
            
            Section(header: Text("Layouts")) {
                NavigationLink(
                    destination: FormDemo(),
                    label: { NavItem("Form", "square.and.pencil")}
                )
                
                NavigationLink(
                    destination: SimpleAnimationDemo(),
                    label: { NavItem("Z Stack", "square.stack.3d.down.right.fill")}
                )
                
                NavigationLink(
                    destination: VStackDemo(),
                    label: { NavItem("Vertical Stack", "square.stack.fill")}
                )
                
                NavigationLink(
                    destination: AnimationEaseOut(),
                    label: { NavItem("Horizontal Stack", "square.stack")}
                )
                
            }
            
            Section(header: Text("Colors and Shapes")) {
                NavigationLink(
                    destination: GradientDemo(),
                    label: { NavItem("Gradient", "eyedropper")}
                )
                
                NavigationLink(
                    destination: TrimDemo(),
                    label: { NavItem("Trim", "scissors")}
                )
            }
            
            Section(header: HStack {
                Image(systemName: "person")
                Text("User Interaction")
            }) {
                NavigationLink(
                    destination: ButtonsDemo(),
                    label: { NavItem("Button", "delete.right.fill")}
                )
                
                NavigationLink(
                    destination: AlertDemo(),
                    label: { NavItem("Alert", "message.fill")}
                )
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
                        NavItem("Maps", "map.fill")
                }
            )
            
            NavigationLink(
                destination: GridsDemo(),
                label: {
                    NavItem("Grids", "square.grid.4x3.fill")
                }
            )
            
        }
    }
}

struct NavItem: View {
    
    let title: String?
    let image: String?
    
    init(_ title: String?, _ image: String?) {
        self.title = title
        self.image = image
    }
    
    var body: some View {
        HStack {
            Image(systemName: image ?? "questionmark.circle")
            Text(title ?? "Unknown")
        }
    }
}

struct SidebarDemo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainNavigation()
                .preferredColorScheme(.dark)
                .previewDevice("iPad Air (4th generation)")
            MainNavigation()
                .preferredColorScheme(.light)
                .previewDevice("iPhone 11")
        }
    }
}

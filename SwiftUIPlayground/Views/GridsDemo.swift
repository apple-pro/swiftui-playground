//
//  GridsDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/20/20.
//

import SwiftUI

//for ref:
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid
struct GridsDemo: View {
    
    let data = Array(1...10000).map { "Item \($0)" }
    
    let layout = [
        GridItem(.adaptive(minimum: 80))
        
        //3 columns:
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
        
        //2 columns:
//        GridItem(.adaptive(minimum: 80)),
//        GridItem(.flexible())
    ]
    
    var body: some View {
        //vertical
        ScrollView {
            LazyVGrid(columns: layout, spacing: 20) {
        //horizontal
//      ScrollView(.horizontal) {
//          LazyHGrid(rows: layout, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    ZStack {
                        Color.blue
                        Text(item)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(Color.green)
                    .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
        }
    }
}

struct GridsDemo_Previews: PreviewProvider {
    static var previews: some View {
        GridsDemo()
    }
}

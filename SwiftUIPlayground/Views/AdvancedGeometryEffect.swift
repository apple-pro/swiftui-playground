//
//  AdvancedGeometryEffect.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 10/3/20.
//

import SwiftUI

struct AdvancedGeometryEffect: View {
    
    @Namespace private var namespace
    @State var showOverlay = false
    
    var body: some View {
        ZStack {
            SearchList(showOverlay: $showOverlay, namespace: namespace)
            
            if showOverlay {
                SearchOverlay(showOverlay: $showOverlay, namespace: namespace)
            }
        }
        .navigationBarHidden(showOverlay)
        .navigationTitle("Geometry Effect V2")
    }
}

struct SearchList: View {
    
    @State var myText = "Test"
    @Binding var showOverlay: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            
            if !showOverlay {
                TextField("My Text", text: $myText).onTapGesture {
                    withAnimation {
                        showOverlay.toggle()
                    }
                }
                .padding()
                .border(Color.red, width: 1)
                .matchedGeometryEffect(id: "Thing", in: namespace)
            }
            
            List {
                Text("1")
                Text("2")
                Text("3")
                Text("4")
            }
        }
        .padding()
    }
}


struct SearchOverlay: View {
    
    @State var myText = "Test"
    @Binding var showOverlay: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            TextField("My Text", text: $myText)
                .foregroundColor(.white)
                .padding()
                .border(Color.red, width: 1)
                .matchedGeometryEffect(id: "Thing", in: namespace)
            
            Button("Close") {
                withAnimation {
                    showOverlay.toggle()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.gray.opacity(0.90))
        
    }
}

struct AdvancedGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedGeometryEffect()
    }
}

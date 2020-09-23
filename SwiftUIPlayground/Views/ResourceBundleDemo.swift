//
//  ResourceBundleDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/24/20.
//

import SwiftUI

struct ResourceBundleDemo: View {
    
    private var commonPasswords = [String]()
    
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            List {
                Text("Test")
                Text("Test")
                Text("Test")
            }.listStyle(InsetListStyle())
            
            TextField("Your password...", text: $password)
                .frame(maxWidth: 300)
                .background(Color.gray.opacity(0.5))
                .foregroundColor(.white)
            
            
        }
        .padding()
        .background(Color.orange)
        .onAppear(perform: loadDataFromBundle)
    }
    
    func loadDataFromBundle() {
        
    }
}

struct ResourceBundleDemo_Previews: PreviewProvider {
    static var previews: some View {
        ResourceBundleDemo()
    }
}

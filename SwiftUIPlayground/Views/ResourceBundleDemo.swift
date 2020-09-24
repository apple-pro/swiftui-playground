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
    @State private var isCommon = true
    
    var body: some View {
        VStack {
            List {
                Text("Test")
                Text("Test")
                Text("Test")
            }.listStyle(InsetListStyle())
            
            VStack {
                TextField("Your password...", text: $password)
                    .frame(maxWidth: 300)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: 300)
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding()
            .background(isCommon ? Color.red : Color.green)
            .clipShape(Capsule())
            
        }
        .padding()
        .background(Color.orange)
        .onAppear(perform: loadDataFromBundle)
    }
    
    //refer to this awesome guide:
    //https://www.hackingwithswift.com/books/ios-swiftui/running-code-when-our-app-launches
    func loadDataFromBundle() {
        if let wordsURL = Bundle.main.url(forResource: "Resources/common-passwordstxt", withExtension: "txt") {
            print("URL Worked")
            
            
        } else {
            print("URL Failed")
        }
    }
}

struct ResourceBundleDemo_Previews: PreviewProvider {
    static var previews: some View {
        ResourceBundleDemo()
    }
}

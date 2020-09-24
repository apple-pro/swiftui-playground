//
//  ResourceBundleDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/24/20.
//

import SwiftUI

struct ResourceBundleDemo: View {
    
    @State private var commonPasswords = ["password", "secret"]
    @State private var password: String = ""
    
    private var isCommon: Bool {
        commonPasswords.contains(password)
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(commonPasswords, id: \.self) {
                    Text($0)
                }
            }.listStyle(InsetListStyle())
            
            VStack {
                TextField("Your password...", text: $password)
                    .autocapitalization(.none)
                    .frame(maxWidth: 300)
                    .foregroundColor(isCommon ? .red : .green)
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
        if let wordsURL = Bundle.main.url(forResource: "common-passwords", withExtension: "txt") {
            print("URL Worked")
            
            if let badWords = try? String(contentsOf: wordsURL) {
                commonPasswords = badWords.components(separatedBy: "\n")
                
                print("Words Loaded")
                return
            }
        }
        print("Faile to Load Words!")
    }
}

struct ResourceBundleDemo_Previews: PreviewProvider {
    static var previews: some View {
        ResourceBundleDemo()
    }
}

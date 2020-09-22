//
//  AlertDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/22/20.
//

import SwiftUI

struct AlertDemo: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
    }
}

struct AlertDemo_Previews: PreviewProvider {
    static var previews: some View {
        AlertDemo()
    }
}

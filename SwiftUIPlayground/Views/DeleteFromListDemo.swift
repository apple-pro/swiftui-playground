//
//  DeleteFromListDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/24/20.
//

import SwiftUI

struct DeleteFromListDemo: View {
    
    @State private var numbers = [1,2,3]
    @State private var currentNumber = 4
    
    var body: some View {
        VStack {
            Text("Note: Swipe to Delete")
            
            List {
                ForEach(numbers, id: \.self) {
                    Text("\($0)")
                }.onDelete(perform: removeRows)
            }
            
            Button("Add Number") {
                self.numbers.append(self.currentNumber)
                self.currentNumber += 1
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct DeleteFromListDemo_Previews: PreviewProvider {
    static var previews: some View {
        DeleteFromListDemo()
    }
}

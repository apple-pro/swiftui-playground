//
//  FormDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/21/20.
//

import SwiftUI

struct FormDemo: View {
    
    @State var isMale = false
    @State var firstName = ""
    @State var lastName = ""
    @State var username = ""
    @State var password = ""
    @State var favoritePokemon = ""
    @State var numberOfFriends = 1
    @State var birthday = Date()
    
    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                
                Picker(selection: $favoritePokemon, label: Text("Favorite Pokemon")) {
                    Text("Pikachu")
                    Text("Squirtle")
                    Text("Charmander")
                    Text("Bulbasaur")
                }
                
                Toggle(isOn: $isMale) {
                    Text(isMale ? "Male" : "Female")
                }
                
                DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                    Text("Birthday")
                }
                
                Stepper("Friends (\(numberOfFriends))", value: $numberOfFriends, in: 1...10)
            }
            
            Section(header: Text("Account")) {
                
                TextField("Username", text: $username)
                SecureField("Password", text: $password)
            }
            
            Section(header: Text("About")) {
                
                HStack {
                    Text("Operating System")
                    Spacer()
                    Text("iOS")
                }
                
                HStack {
                    Text("Version")
                    Spacer()
                    Text("14.1")
                }
            }
        }
        .navigationBarTitle("Form Demo")
        .navigationBarItems(trailing: Button("") {
            print("Form Button!")
        })
    }
}

struct FormDemo_Previews: PreviewProvider {
    static var previews: some View {
        FormDemo()
    }
}

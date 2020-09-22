//
//  FormDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/21/20.
//

import SwiftUI

struct FormDemo: View {
    
    @State var isMale = false
    @State var attractedToMen = false
    @State var attractedToWomen = false
    @State var showPassword = false
    @State var firstName = ""
    @State var lastName = ""
    @State var username = ""
    @State var password = ""
    @State var favoritePokemon = "Pikachu"
    @State var numberOfFriends = 1
    @State var birthday = Date()
    @State var genderOrientation = "Male"
    
    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                
                Picker(selection: $favoritePokemon, label: Text("Favorite Pokemon")) {
                    TextPickerItem("Pikachu")
                    TextPickerItem("Squirtle")
                    TextPickerItem("Charmander")
                    TextPickerItem("Bulbasaur")
                }
                
                Picker("Gender Identity", selection: $genderOrientation) {
                    TextPickerItem("Male")
                    TextPickerItem("Female")
                    TextPickerItem("Others")
                }
                .pickerStyle(SegmentedPickerStyle())
                
                if (genderOrientation == "Others") {
                    
                    Toggle(isOn: $isMale) {
                        Text("Biological \(isMale ? "Male" : "Female")")
                    }
                    
                    Toggle(isOn: $attractedToMen) {
                        Text("Are you attracted to men?")
                    }
                    
                    Toggle(isOn: $attractedToWomen) {
                        Text("Are you attracted to women?")
                    }
                }
                
                DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                    Text("Birthday")
                }
                
                Stepper("Friends (\(numberOfFriends))", value: $numberOfFriends, in: 1...10)
            }
            
            
            Section(header: Text("Account")) {
                
                TextField("Username", text: $username)
                
                HStack {
                    if showPassword {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: "eye")
                    }
                }
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
        .accentColor(.orange)
        .navigationBarTitle("Form Demo")
        .navigationBarItems(trailing: Button("") {
            print("Form Button!")
        })
    }
}

struct TextPickerItem: View {
    let label: String
    
    init(_ label: String) {
        self.label = label
    }
    
    var body: some View {
        Text(label).tag(label)
    }
}

struct FormDemo_Previews: PreviewProvider {
    static var previews: some View {
        FormDemo()
    }
}

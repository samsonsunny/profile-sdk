//
//  CreateProfileView.swift
//  
//
//  Created by sam on 11-04-2024.
//

import Foundation
import SwiftUI
import Combine

struct CreateProfileView: View {
    
    @State private var contact: Contact = Contact()
    @State var saveDisabled: Bool = true
    @State var showCamera: Bool = false
    
    @FocusState private var nameIsFocused: Bool
    @FocusState private var emailIsFocused: Bool
    @FocusState private var phoneNumberIsFocused: Bool
    
    @Environment(\.dismiss) var dismiss
             
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .center) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Profile")
                    .font(.headline)
                Spacer()
                Button {
                    saveProfile()
                } label: {
                    Text("Done")
                }.disabled(saveDisabled)
            }.padding()
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    ProfileImageView(image: $contact.imageData)
                        .onTapGesture {
                            showCamera = true
                        }
                    BorderedInputField(label: "Name", text: $contact.name)
                        .focused($nameIsFocused)
                        .keyboardType(.namePhonePad)
                        .autocorrectionDisabled()
                        .onReceive(Just(contact.name), perform: { output in
                            validate()
                        })
                        .onSubmit {
                            nameIsFocused = false
                            emailIsFocused = true
                        }
                    BorderedInputField(label: "Email", text: $contact.email)
                        .focused($emailIsFocused)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .onReceive(Just(contact.email), perform: { output in
                            validate()
                        })
                        .onSubmit {
                            emailIsFocused = false
                            phoneNumberIsFocused = true
                        }
                    BorderedInputField(label: "Phone Number", text: $contact.phoneNumber)
                        .focused($phoneNumberIsFocused)
                        .keyboardType(.numberPad)
                        .onReceive(Just(contact.phoneNumber), perform: { output in
                            validate()
                        })
                        .onSubmit {
                            nameIsFocused = false
                            emailIsFocused = false
                            phoneNumberIsFocused = false
                        }
                    Spacer()
                }
                .padding()
            }
        }
        
        .fullScreenCover(isPresented: $showCamera) {
            ImagePicker(selectedImage: $contact.imageData)
        }
    }
    
    func validate() {
        if !contact.name.isEmpty && !contact.email.isEmpty && !contact.phoneNumber.isEmpty {
            saveDisabled = false
        } else {
            saveDisabled = true
        }
    }
    
    func saveProfile() {
        let encoder = PropertyListEncoder()
        if let encodedContact = try? encoder.encode(contact) {
            UserDefaults.standard.set(encodedContact, forKey: "profile_info")
        }
        dismiss()
    }
}

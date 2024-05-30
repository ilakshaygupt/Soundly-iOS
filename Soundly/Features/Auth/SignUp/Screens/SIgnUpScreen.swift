//
//  SignUpScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 24/05/24.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var username: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var isPhoneNumber: Bool = true
    @FocusState private var isUsernameFieldFocused: Bool
    @FocusState private var isPhonenumberFieldFocused: Bool
    @FocusState private var isEmailFieldFocused: Bool
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                
                VStack {
                    Image("SignIn")
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 10, trailing: 0))
                    
                    VStack {
                        Text("Sign Up")
                            .font(.system(size: 28))
                            .bold()
                            .padding()
                        
                        HStack {
                            Text("Welcome To")
                                .font(.system(size: 26))
                            
                            Text("Soundly")
                                .foregroundColor(Color(red: 0.0, green: 0.545, blue: 0.545))
                                .font(.system(size: 26))
                                .bold()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Username")
                                .font(.system(size: 14))
                            
                            TextField("Enter your username", text: $username)
                                .padding()
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(!isUsernameFieldFocused ? Color.gray : Color.black, lineWidth: 1)
                                )
                                .cornerRadius(10)
                                .padding(.bottom, 10)
                                .focused($isUsernameFieldFocused)
                            
                            HStack {
                                Text(isPhoneNumber ? "Phone Number" : "Email")
                                    .font(.system(size: 14))
                                
                                Spacer()
                                
                                Button(action: {
                                    isPhoneNumber.toggle()
                                }) {
                                    Text(isPhoneNumber ? "Sign up with Email?" : "Sign up with Phone?")
                                        .font(.system(size: 14))
                                        .foregroundColor(.teal)
                                        .bold()
                                }
                            }
                            
                            if isPhoneNumber {
                                TextField("Enter your phone number", text: $phoneNumber)
                                    .padding()
                                    .background(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(!isPhonenumberFieldFocused ? Color.gray : Color.black, lineWidth: 1)
                                    )
                                    .cornerRadius(10)
                                    .focused($isPhonenumberFieldFocused)
                            } else {
                                TextField("Enter your email", text: $email)
                                    .padding()
                                    .background(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(!isEmailFieldFocused ? Color.gray : Color.black, lineWidth: 1)
                                    )
                                    .cornerRadius(10)
                                    .focused($isEmailFieldFocused)
                            }
                        }
                        .padding()
                        
                        Button(action: {
                            print("Continue button tapped")
                        }) {
                            Text("Continue")
                                .frame(width: geometry.size.width * 0.85)
                                .font(.system(size: 20))
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0.0, green: 0.545, blue: 0.545))
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 40)
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.62)
                    .background(Color(red: 213/255, green: 234/255, blue: 234/255, opacity: 1.0))
                    .cornerRadius(50)
                    .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Spacer()
                            Image("S")
                            Text("Soundly")
                                .font(.system(size: 28))
                            
                            NavigationLink(destination:LoginScreen()){
                                Text("Login")
                                    .foregroundColor(Color(red: 0.0, green: 0.545, blue: 0.545))
                                    .bold()
                                    .font(.system(size: 20))
                                
                                    .padding(.leading, 20)
                            }
                        }
                    }
                }
            }
        }.ignoresSafeArea(.keyboard)
    }
}

#Preview {
    SignUpScreen()
}

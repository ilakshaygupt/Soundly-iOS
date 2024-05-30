//
//  LoginScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 30/05/24.
//

import SwiftUI

struct LoginScreen: View {
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
                        Text("Login")
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
                        Text("Create an account or login using your  \n mobile number or email to get started").padding(.top,8).font(.system(size: 16))
                        
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
                            
                           
                        }
                        .padding(EdgeInsets(.init(top: 10, leading: 16, bottom: 0, trailing: 16)))
                        
                        HStack{
                            Spacer()
                            NavigationLink (
                            destination: ForgotUsername()
                            ){
                                Text("Forgot Username?").padding(.trailing,10)
                            }
                        }.padding(.bottom,10)
                        
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
                            
                            NavigationLink(destination:SignUpScreen()){
                                Text("Sign Up")
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
    LoginScreen()
}

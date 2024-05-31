//
//  ForgotUsername.swift
//  Soundly
//
//  Created by Lakshay Gupta on 30/05/24.
//

import SwiftUI

struct ForgotUsername: View {
    @State private var username: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var isPhoneNumber: Bool = true
    @FocusState private var isUsernameFieldFocused: Bool
    @FocusState private var isPhonenumberFieldFocused: Bool
    @FocusState private var isEmailFieldFocused: Bool
    
    var body: some View {
        
            NavigationStack {
                VStack {
                    Image("SignIn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 10, trailing: 0))
                    
                    VStack {
                        Text("Login")
                            .font(.system(size: 28))
                            .bold()
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 4, trailing: 0))
                        
                        HStack {
                            Text("Welcome To")
                                .font(.system(size: 26))
                            
                            Text("Soundly")
                                .foregroundColor(Color(red: 0.0, green: 0.545, blue: 0.545))
                                .font(.system(size: 26))
                                .bold()
                        }
                        
                        Text("Enter your registered \n \(isPhoneNumber ? "Phone Number" : "Email")")
                            .font(.system(size: 22))
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 4, leading: 16, bottom: 0, trailing: 16))
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Text(isPhoneNumber ? "Phone Number" : "Email")

                                    .font(.system(size: 14))
                                Spacer()
                                Button(action: {
                                    isPhoneNumber.toggle()
                                }) {
                                    Text("via \(isPhoneNumber ? "Email" : "Phone")")
                                        .foregroundColor(.teal)
                                        .bold()
                                        .font(.system(size: 10))
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
                                    .padding(.bottom, 10)
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
                                    .padding(.bottom, 10)
                                    .focused($isEmailFieldFocused)
                            }
                        }
                        .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 16))
                  
                        NavigationLink(destination: OTPScreen(isPhoneNumber: isPhoneNumber, contactInfo: isPhoneNumber ? phoneNumber : email)) {
                            
                            Text("Continue")
                                .frame(width:getScreenBounds().width * 0.8 )
                                .font(.system(size: 20))
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0.0, green: 0.545, blue: 0.545))
                                .cornerRadius(10)
                        }
                        
                        
                        Spacer(minLength: 0)
                    }
                    .frame(width: getScreenBounds().width ,height: getScreenBounds().height * 0.5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 213/255, green: 234/255, blue: 234/255, opacity: 1.0))
                    .cornerRadius(50)
                    .padding()
                    
                }
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        HStack {
                            Spacer()
                            Image("S")
                            Text("Soundly")
                                .font(.system(size: 28))
                            
                            Button {
                                // action
                            } label: {
                                Text("Login")
                                    .foregroundColor(Color(red: 0.0, green: 0.545, blue: 0.545))
                                    .bold()
                                    .font(.system(size: 20))
                            }
                            .padding(.leading, 40)
                        }
                    }
                }
            }
            .ignoresSafeArea(.keyboard)
        }
    
}

struct ForgotUsername_Previews: PreviewProvider {
    static var previews: some View {
        ForgotUsername()
    }
}

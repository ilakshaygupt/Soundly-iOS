//
//  LoginScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 30/05/24.
//

import SwiftUI
import Toast


struct LoginScreen: View {
    @ObservedObject var viewModel = LoginViewModel()
    @State private var username: String = ""
    @FocusState private var isUsernameFieldFocused: Bool

    var body: some View {
        if viewModel.isSuccess {
            OTPScreen(username: username, isPhoneNumber: nil, contactInfo: nil)
        }
        else{
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
                                .textInputAutocapitalization(.never)
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
                            viewModel.username = username
                            viewModel.login()
                        }) {
                            if viewModel.isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .foregroundColor(.white)
                            } else {
                                Text("Send")
                                    .frame(width: getScreenBounds().width * 0.8)
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(red: 0.0, green: 0.545, blue: 0.545))
                                    .cornerRadius(10)
                                    .padding(.bottom, 40)
                            }
                        }
                        .frame(width: getScreenBounds().width * 0.8,height: getScreenBounds().height*0.1)


                    }
                    .frame(width: getScreenBounds().width,height:getScreenBounds().height * 0.5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        }
    }
}

#Preview {
    LoginScreen()
}

//
//  OTPScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 30/05/24.
//

import SwiftUI

struct OTPScreen: View {
    @State private var otp: String = ""
    @State private var isSignedSuccessFully: Bool = false
    let isPhoneNumber: Bool
    let contactInfo: String
    @FocusState private var isOTPFieldFocused: Bool
    
    var body: some View {
      
        
            
            NavigationStack {
                VStack (alignment: .center){
                    Image("OTPIllustration")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: getScreenBounds().height * 0.4 )
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 10, trailing: 0))
                    
                    
                    VStack(spacing:20) {
                        Text("Enter OTP")
                            .font(.system(size: 28))
                            .bold()
                        
                        Text("Please enter the 4-digit code sent to you at \(contactInfo)")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                        
                        TextField("Enter OTP", text: $otp)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(!isOTPFieldFocused ? Color.gray : Color.black, lineWidth: 1)
                            )
                            .cornerRadius(10)
                            .focused($isOTPFieldFocused)
                            .frame(width: getScreenBounds().width * 0.8)
                        
                        Text("Send")
                            .frame(width: getScreenBounds().width * 0.8)
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.0, green: 0.545, blue: 0.545))
                            .cornerRadius(10)
                            .onTapGesture {
                                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                                        let window = windowScene?.windows.first
                                window?.rootViewController = UIHostingController(rootView: LanguageSelectionScreen())
                                window?.makeKeyAndVisible()
                            }

                       
                        
                        .padding(.bottom, 40)
                        
                    }
                    .frame(width: getScreenBounds().width,height:getScreenBounds().height * 0.5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 213/255, green: 234/255, blue: 234/255, opacity: 1.0))
                    .cornerRadius(50)
                    .padding()
                    
                }.toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Spacer()
                            Image("S")
                            Text("Soundly")
                                .font(.system(size: 28))
                            Spacer()
                
                            NavigationLink(destination: LoginScreen()) {
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
        }
    
    
}

#Preview {
    OTPScreen(isPhoneNumber: true, contactInfo: "example@example.com")
}
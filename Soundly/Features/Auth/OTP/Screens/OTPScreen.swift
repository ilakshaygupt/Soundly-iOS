//
//  OTPScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 30/05/24.
//

import SwiftUI

struct OTPScreen: View {
    @State private var otp: String = ""
    let isPhoneNumber: Bool
    let contactInfo: String
    @FocusState private var isOTPFieldFocused: Bool
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack (alignment: .center){
                    Image("OTPIllustration")
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 40, trailing: 0))
                    
                    VStack {
                        Text("Enter OTP")
                            .font(.system(size: 28))
                            .bold()
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 4, trailing: 0))
                        
                        Text("Please enter the 4-digit code sent to you at \(contactInfo)")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        TextField("Enter OTP", text: $otp)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(!isOTPFieldFocused ? Color.gray : Color.black, lineWidth: 1)
                            )
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                            .focused($isOTPFieldFocused)
                            .frame(width:geometry.size.width*0.85)
                        
                        Button(action: {
                            print("Send button tapped")
                        }) {
                            Text("Send")
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
                    .frame(width: geometry.frame(in: .global).width , height: geometry.size.height * 0.62)
                    .background(Color(red: 213/255, green: 234/255, blue: 234/255, opacity: 1.0))
                    .cornerRadius(50)
                    .padding()
                    
                }.frame(alignment: .center)
                
            
            }
        }.ignoresSafeArea(.keyboard)
    }
}

#Preview {
    OTPScreen(isPhoneNumber: true, contactInfo: "example@example.com")
}

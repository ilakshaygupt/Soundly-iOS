//
//  OTPScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 30/05/24.
//
import SwiftUI

struct OTPScreen: View {
    @ObservedObject var viewModel = OTPViewModel()
    @State private var otp: String = ""
    @State private var isSignedSuccessFully: Bool = false
    let username: String
    let isPhoneNumber: Bool?
    let contactInfo: String?
    @FocusState private var isOTPFieldFocused: Bool
    private let numberOfFieldsInOTP = 4

    var body: some View {
        if viewModel.success {
            LanguageSelectionScreen()
        } else {
            NavigationStack {
                VStack(alignment: .center) {
                    Image("OTPIllustration")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: getScreenBounds().height * 0.4)
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 10, trailing: 0))

                    VStack(spacing: 20) {
                        Text("Enter OTP")
                            .font(.system(size: 28))
                            .bold()

                        Text("Please enter the 4-digit code sent to you at \(contactInfo ?? "")")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)

                        OTPFieldView(numberOfFields: numberOfFieldsInOTP, otp: $otp)
                            .onChange(of: otp) { newOtp in
                                if newOtp.count == numberOfFieldsInOTP {
                                    // Verify OTP
                                }
                            }
                        
                            .focused($isOTPFieldFocused)





                        Button(action: {
                            viewModel.otp = otp
                            viewModel.verifyOtp()
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
                        .frame(width: getScreenBounds().width * 0.8,height: getScreenBounds().height * 0.09)

                        .alert(isPresented: $viewModel.isErrorToast) {
                                                    Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
                                                }

                    }
                    .frame(width: getScreenBounds().width, height: getScreenBounds().height * 0.5)
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
}

#Preview {
    OTPScreen(username: "naman", isPhoneNumber: true, contactInfo: "7318919744")
}

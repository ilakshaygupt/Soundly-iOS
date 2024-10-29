//
//  ToastModifier.swift
//  Soundly
//
//  Created by Lakshay Gupta on 23/10/24.
//

import Foundation

import SwiftUI
import SwiftUI

public struct SnackbarView: View {

    public init(show: Binding<Bool>, bgColor: Color, txtColor: Color, icon: String?, iconColor: Color, message: String) {
        self._show = show
        self.bgColor = bgColor
        self.txtColor = txtColor
        self.icon = icon
        self.iconColor = iconColor
        self.message = message
    }

    @Binding public var show: Bool
    public var bgColor: Color
    public var txtColor: Color
    public var icon: String?
    public var iconColor: Color
    public var message: String
    let paddingBottom = (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) + 54

    public var body: some View {
        if self.show {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 12) {
                    if let name = icon {
                        Image(systemName: name)
                            .resizable()
                            .foregroundColor(self.iconColor)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 14, height: 14)
                    }

                    Text(message)
                        .foregroundColor(txtColor)
                        .font(.system(size: 14))
                        .frame(alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, minHeight: 50) // Increase the minimum height for more prominence
                .padding(.vertical, 10)
                .background(bgColor)
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.bottom, show ? self.paddingBottom : 0)
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2) // Add shadow for elevation
                .animation(.easeInOut)
            }
            .transition(.move(edge: .top)) // Change transition direction to top
            .edgesIgnoringSafeArea(.top) // Ignore safe area for the top edge
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.show = false
                }
            }
        }
    }
}

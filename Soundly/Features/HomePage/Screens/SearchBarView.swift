//
//  SearchBarView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .bold()

            TextField("What do you want to listen to ?", text: $text, onCommit: onSearch)

            Button(action: {
                self.text = ""
                self.onSearch()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
        .frame(height: 50)
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.black, lineWidth: 1))
        .padding(.horizontal)
    }
}

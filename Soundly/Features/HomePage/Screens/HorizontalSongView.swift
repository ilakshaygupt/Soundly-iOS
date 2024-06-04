//
//  HorizontalSongView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import SwiftUI

struct HorizontalSongView: View {
    let things: [String] = ["Thing1", "Thing2", "Thing3", "Thing4", "Thing5", "Thing6", "Thing7", "Thing8", "Thing9", "Thing10"]
    
      
    var body: some View {
        VStack{
            
            Text("FOR YOU")
            ScrollView(.horizontal) {
                ScrollViewReader { value in
                    LazyHStack {
                        ForEach(0..<things.count) { i in
                            Text(things[i])
                                .id(i)
                                .frame(width: 180,height: 180)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                .padding()
                        }
                        .onAppear {
                            if getLangDirection() == .rightToLeft {
                                value.scrollTo(things.count - 1)
                            }
                        }
                    }
                    
                }
            }
            
        }
    }
      
      func getLangDirection() -> Locale.LanguageDirection? {
          guard let language = Locale.current.languageCode else { return nil }
          let direction = Locale.characterDirection(forLanguage: language)
          return direction
      }
      
}

#Preview {
    HorizontalSongView()
}

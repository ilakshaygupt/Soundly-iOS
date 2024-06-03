//
//  LanguageSelectionScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 31/05/24.
//
import SwiftUI

struct LanguageSelectionScreen: View {
    @State private var selectedLanguages: Set<String> = []

    let languageOptions = ["Hindi", "English", "Haryanvi", "Punjabi"]
    var body: some View {
        NavigationStack{
            VStack(alignment: .center) {
                Text("Which language songs are your favorite?")
                    .font(.system(size: 24))
                    .padding()
                List {
                    ForEach(languageOptions, id: \.self) { language in
                        Text(language)
                            .foregroundColor(self.selectedLanguages.contains(language) ? .white : .black)
                            .frame(width: getScreenBounds().width * 0.70 ,height: 70)
                            .background(self.selectedLanguages.contains(language) ? Color(red: 0.0, green: 0.545, blue: 0.545) : Color.clear)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            .padding()
                            .font(.system(size: 20))
                            .bold()
                            .onTapGesture {
                                if self.selectedLanguages.contains(language) {
                                    self.selectedLanguages.remove(language)
                                } else {
                                    self.selectedLanguages.insert(language)
                                }
                            }
                    }
                    
                }
                .scrollContentBackground(.hidden)
                Spacer()
                
                HStack{
                    Spacer()
                    NavigationLink(destination:ArtistSelectionScreen()){
                        Text("NEXT")
                        
                            .foregroundColor(Color(red: 0.0, green: 0.545, blue: 0.545))
                            .bold()
                        
                    }
                    
                    
                }.padding()
            }
        }
        }
    
}

struct LanguageSelectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectionScreen()
    }
}

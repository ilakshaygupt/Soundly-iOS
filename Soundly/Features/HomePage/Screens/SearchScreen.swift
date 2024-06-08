//
//  SearchScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//
import SwiftUI

struct SearchScreen: View {
    @ObservedObject var viewModel = SongSeachViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $viewModel.searchText, onSearch: viewModel.searchSongs)
                Spacer()
                Text("Results for: \(viewModel.searchText)")
                Spacer()
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(viewModel.songs, id: \.id) { song in
                            SongHorizontalView(song: song)
                            Divider().background(Color.black).padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Hey, Lakshay")
                            .font(.system(size: 28))
                        Spacer()
                        Image("Honey Singh")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
}


struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}


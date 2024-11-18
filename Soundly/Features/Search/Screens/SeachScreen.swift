//
//  SearchScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//
import SwiftUI

class SongSeachViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var songs: [Song] = []
    @Published var errorMessage: String?

    private let songSearchAction = SongSeachAction()

    func searchSongs() {
        songSearchAction.call(
            query: searchText,
            completion: { response in
                self.songs = response.data
                self.errorMessage = nil
            },
            failure: { error in
                self.errorMessage = error.localizedDescription
            }
        )
    }
}


struct SearchScreen: View {
    @StateObject var viewModel = SongSeachViewModel()

    var body: some View {

        ZStack{
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


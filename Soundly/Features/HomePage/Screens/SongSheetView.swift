//
//  SongSheetView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//

import SwiftUI
import AVKit

struct SongSheetView: View {
    let player: AVPlayer
    let song: SongData


    init(player: AVPlayer, song: SongData) {


            self.player = player
            self.song = song





    }

    var body: some View {
        VStack {

            AsyncImage(url: URL(string: song.thumbnail_url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .scaledToFill()
                    .frame(width: getScreenBounds().width * 0.9, height: getScreenBounds().width * 0.9 )
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .controlSize(.large)
            }
            HStack{
                Text(song.name)
                    .font(.largeTitle)
                    .bold()
                    .fontWeight(.heavy)
                Spacer()
                Image(systemName: song.is_liked ? "heart.fill" : "heart")
                    .font(.largeTitle)

                    .foregroundColor(song.is_liked ? .teal : .black)

            }.padding(getScreenBounds().width * 0.05)


            PlayerControls(song: song, player: player)
                .padding(getScreenBounds().width * 0.05)

            Spacer()
        }.padding()
    }
}

#Preview {
    SongSheetView(player: AVPlayer(url: URL(string: "http://res.cloudinary.com/ds9i3o1hj/video/upload/v1699643615/govkwctv3ruygncrqlnl.mp3")!), song: SongData(id: 59, name: "Brown Rang", song_url: "http://res.cloudinary.com/ds9i3o1hj/video/upload/v1699643615/govkwctv3ruygncrqlnl.mp3", thumbnail_url: "http://res.cloudinary.com/ds9i3o1hj/image/upload/v1699643612/euzlwq1tmtwbxlnr1vzr.jpg", is_liked: true, lyrics_url: nil, song_duration: "02:59", lyrics_json: nil))
}

//
//  ContentView.swift
//  SoundlyWatchOs Watch App
//
//  Created by Lakshay Gupta on 22/10/24.
//
import SwiftUI

struct NowPlayingView: View {
    @StateObject private var viewModel = WatchNowPlayingViewModel()
    @State private var isDragging = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {

                if let song = viewModel.currentSong {
                    Text(song.title)
                        .font(.system(size: 16, weight: .semibold))
                        .lineLimit(1)
                        .padding(.horizontal)
                    
                    Text(song.artist)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .padding(.horizontal)
                    

//                    ProgressSlider(
//                        value: Binding(
//                            get: { song.currentTime },
//                            set: { viewModel.seek(to: $0) }
//                        ),
//                        isDragging: $isDragging,
//                        maxValue: song.duration
//                    )
//                    .padding(.horizontal)
                    

                    HStack {
                        Text(formatTime(song.currentTime))
                            .font(.system(size: 12))
                        Spacer()
                        Text(formatTime(song.duration))
                            .font(.system(size: 12))
                    }
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    

                    HStack(spacing: 20) {

                            Image(systemName: "backward.fill")
                                .font(.system(size: 20))

                        
                        Button(action: viewModel.togglePlayPause) {
                            Image(systemName: song.isPlaying ? "pause.fill" : "play.fill")
                                .font(.system(size: 24))
                        }
                
                            Image(systemName: "forward.fill")
                                .font(.system(size: 20))

                    }
                    .padding(.top, 8)
                } else {
                    Text("No Song Playing")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    private func formatTime(_ timeInSeconds: Double) -> String {
        let minutes = Int(timeInSeconds) / 60
        let seconds = Int(timeInSeconds) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

struct ProgressSlider: View {
    @Binding var value: Double
    @Binding var isDragging: Bool
    let maxValue: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 4)
                
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: max(0, min(CGFloat(value / maxValue) * geometry.size.width, geometry.size.width)), height: 4)
                
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 12, height: 12)
                    .position(x: max(6, min(CGFloat(value / maxValue) * geometry.size.width, geometry.size.width - 6)), y: 2)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { gesture in
                                isDragging = true
                                let newValue = Double(gesture.location.x / geometry.size.width) * maxValue
                                value = max(0, min(newValue, maxValue))
                            }
                            .onEnded { _ in
                                isDragging = false
                            }
                    )
            }
        }
        .frame(height: 20)
    }
}

#Preview  {
    NowPlayingView()
}

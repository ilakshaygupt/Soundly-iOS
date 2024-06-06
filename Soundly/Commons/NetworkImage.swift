//
//  NetworkImage.swift
//  Soundly
//
//  Created by Lakshay Gupta on 06/06/24.
//


import SwiftUI
//
//struct PlaceholderView: View {
//    var body: some View {
//        ProgressView()
//            .progressViewStyle(CircularProgressViewStyle())
//            .padding()
//            .background(Color.gray.opacity(0.3))
//            .cornerRadius(8)
//    }
//}
//
//extension Image {
//    func fromURL(_ url: URL) -> some View {
//        AsyncImage(url: url, placeholder: {
//            PlaceholderView()
//        })
//    }
//}
//
//
//struct AsyncImage<Placeholder: View>: View {
//    @StateObject private var loader: ImageLoader
//    private let placeholder: Placeholder
//    
//    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
//        _loader = StateObject(wrappedValue: ImageLoader(url: url))
//        self.placeholder = placeholder()
//    }
//    
//    var body: some View {
//        if let image = loader.image {
//            Image(uiImage: image)
//                .resizable()
//        } else {
//            placeholder
//        }
//    }
//}
//
//class ImageLoader: ObservableObject {
//    @Published var image: UIImage?
//    private let url: URL
//    
//    init(url: URL) {
//        self.url = url
//        loadImage()
//    }
//    
//    private func loadImage() {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            DispatchQueue.main.async {
//                self.image = UIImage(data: data)
//            }
//        }.resume()
//    }
//}

import SwiftUI

struct NetworkImage: View {
    var imageUrl: URL
    
    var body: some View {
        AsyncImage(url: imageUrl)
        
            .frame(width: 200, height: 200)
            .cornerRadius(8)
    }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(imageUrl: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIiZxRYxUU4ovwZmeSpy_cridLkyqprUE__w&s")!)
    }
}

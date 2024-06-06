//
//  SliderView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 03/06/24.
//

import SwiftUI

struct SliderView: View {
    @State var selection = 1
    var body: some View {
        TabView (selection:$selection){
            ForEach(0..<3){ i in
                SliderPageView(page: SliderAlbums.albumsData[i]).tag(i + 2)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }

}

#Preview {
    SliderView()
}

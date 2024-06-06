//
//  ShimmerView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 06/06/24.
//

import SwiftUI


struct ShimmerView: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .cornerRadius(10)
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(0.5),
                        Color.white.opacity(0.75),
                        Color.white.opacity(0.5)]
                                      ),
                 startPoint: .leading,
                 endPoint: .trailing
                )
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: isAnimating ? 200 : 0, height: 200)
                        .offset(x: isAnimating ? 200 : -200)
                )
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        isAnimating = true
                    }
                }
        }
        .frame(width: 200, height: 200)
    }
}

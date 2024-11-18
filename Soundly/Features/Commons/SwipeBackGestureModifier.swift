//
//  SwipeBackGestureModifier.swift
//  Soundly
//
//  Created by Lakshay Gupta on 18/11/24.
//

import SwiftUI

struct SwipeBackGestureModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    private let swipeThreshold: CGFloat = 100
    @State private var dragOffset: CGSize = .zero

    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { value in
                        // Track the drag offset
                        if value.translation.width > 0 {
                            dragOffset = value.translation
                        }
                    }
                    .onEnded { value in

                        if dragOffset.width > swipeThreshold {
                            presentationMode.wrappedValue.dismiss()
                        }
                        dragOffset = .zero
                    }
            )
    }
}

// Extend View to use the modifier
extension View {
    func swipeBackGesture() -> some View {
        self.modifier(SwipeBackGestureModifier())
    }
}

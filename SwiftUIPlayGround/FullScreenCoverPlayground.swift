//
//  FullScreenPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 09/05/2023.
//

import SwiftUI

// Same as sheet, but it is not possible to drag down view presented using full screen cover.

// @Environment: Property wrapper that reads a value from view's environment.
// Examples: Device Locale, Device Dark/Light Mode etc.

// @Environment(\.presentationMode): iOS 14 or below: Indication whether view is currently presented by another view.

// @Environment(\.dismiss): iOS 15 or later: An action that dismiss current presentation.

struct Playlist: Identifiable {
    let id = UUID().uuidString
    let name: String
}

struct FullScreenCoverPlayground: View {
//    @State private var isCoverVisible = false
    @State private var playlist: Playlist? = nil
    
    var body: some View {
        Button("Show Full Screen Cover") {
            playlist = Playlist(name: "SwiftUI For Beginners")
//            isCoverVisible.toggle()
        }
        .buttonStyle(.borderedProminent)
//        .fullScreenCover(isPresented: $isCoverVisible) {
//            DetailCover()
//        }
        .fullScreenCover(item: $playlist) { playlist in
            DetailCover(playlist: playlist)
        }
    }
}

struct DetailCover: View {
    @Environment(\.dismiss) var dismiss
    var playlist: Playlist
    
    var body: some View {
        VStack {
            Text("This is full screen cover")
            Text(playlist.name)
            Button("Dismiss sheet") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct FullScreenPlayground_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCoverPlayground()
    }
}

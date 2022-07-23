//
//  GifView.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import SwiftUI

struct GifView: View {
    
    var gif: Gif
    
    var body: some View {
        Text(gif.title ?? "TITLE")
    }
}

struct GifView_Previews: PreviewProvider {
    static var previews: some View {
        let gif = Gif(type: "gif", id: "3o6ZtjUZAD5Lf0QFLW", url: "https://giphy.com/gifs/hollywoodsuite-waynes-world-3o6ZtjUZAD5Lf0QFLW", slug: "hollywoodsuite-waynes-world-3o6ZtjUZAD5Lf0QFLW", bitly_gif_url: "http://gph.is/29BHcAR", username: "hollywoodsuite", source: "", title: "Bohemian Rhapsody Car GIF by Hollywood Suite")
        GifView(gif: gif)
    }
}

//user avatar, user name, user description,
//image (you could use Instagram post structure as a reference)

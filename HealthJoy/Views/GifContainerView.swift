//
//  GifView.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import SwiftUI

struct GifContainerView: View {
    
    @State var gif: Gif
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                UserNameView(gif: gif)
                    .padding()
                GifView(urlString: gif.embed_url)
                    .frame(minWidth: UIScreen.main.bounds.width * 0.8, maxWidth: UIScreen.main.bounds.width * 0.8, minHeight: 250, maxHeight: 400, alignment: .center)
                Text(gif.title ?? "Gif Description")

            }
            Spacer()
        }
        .padding(0)
    }

}

struct GifContainerView_Previews: PreviewProvider {
    static var previews: some View {
        
        let user = User(avatar_url: "https://media1.giphy.com/avatars/hollywoodsuite/hd5dYopxgkYr.jpg", username: "hollywoodsuite")
        let gif = Gif(type: "gif", id: "3o6ZtjUZAD5Lf0QFLW", url: "https://giphy.com/gifs/hollywoodsuite-waynes-world-3o6ZtjUZAD5Lf0QFLW", slug: "hollywoodsuite-waynes-world-3o6ZtjUZAD5Lf0QFLW", bitly_gif_url: "http://gph.is/29BHcAR", username: "hollywoodsuite", source: "", title: "Bohemian Rhapsody Car GIF by Hollywood Suite", user: user)
        GifContainerView(gif: gif)
    }
}

//
//  UserNameView.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/22/22.
//

import SwiftUI

struct UserNameView: View {
    var gif: Gif
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                AsyncImage(
                    url: URL(string:  gif.user?.avatar_url ?? "https://i0.wp.com/zblibrary.info/wp-content/uploads/sites/76/2017/03/default-user.png"),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 40, maxHeight: 40)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                    .padding()
            } else {
                // Fallback on earlier versions
            }
            VStack {
                HStack {
                    Text( gif.user?.display_name ?? "unknown user")
                        .bold()
                    Spacer()
                }
                HStack {
                    Text( gif.user?.compUserName ?? "")
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct UserNameView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(avatar_url: "https://media1.giphy.com/avatars/hollywoodsuite/hd5dYopxgkYr.jpg", username: "hollywoodsuite", display_name: "Hollywood Suite")
        let gif = Gif(type: "gif", id: "3o6ZtjUZAD5Lf0QFLW", url: "https://giphy.com/gifs/hollywoodsuite-waynes-world-3o6ZtjUZAD5Lf0QFLW", slug: "hollywoodsuite-waynes-world-3o6ZtjUZAD5Lf0QFLW", bitly_gif_url: "http://gph.is/29BHcAR", username: "hollywoodsuite", source: "", title: "Bohemian Rhapsody Car GIF by Hollywood Suite", user: user)
        UserNameView(gif: gif)
    }
}

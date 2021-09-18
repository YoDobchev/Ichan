//
//  PostView.swift
//  IOS 4chan
//
//  Created by Yoan Dobchev on 16.09.21.
//

import SwiftUI
import AVKit

struct PostView: View {
    var threadId : Int64
    var boardTitle : String
    @State var showPosts = false
    @State var postsL : posts?
    @State var playerMap : [Int : AVPlayer]? = [Int : AVPlayer]()
    var body: some View {
        GeometryReader { geometry in
        ScrollView {
        VStack {
            if showPosts {
                ForEach((postsL!.posts), id: \.self) { p in
                    VStack {
                    if (p.tim != nil) {
                        Button(action: {
                            playerMap![postsL!.posts.firstIndex(of: p)!] = AVPlayer(url: URL(string: "http://xxx.xxx.xxx.xxx:4444/convert/\(boardTitle)/\(p.tim!)")!)
                            playerMap![postsL!.posts.firstIndex(of: p)!]!.play()
                        }) {
                            
                            Image(uiImage: "https://i.4cdn.org/\(boardTitle)/\(p.tim!)s.jpg".load())
                        }
                    }
                    if (p.ext != nil) {
                        switch p.ext {
                        case ".webm":
                            VideoPlayer(player: playerMap![postsL!.posts.firstIndex(of: p)!, default: AVPlayer()]).frame(width: geometry.size.width, height: 300, alignment: .center)
                            
                        case ".jpg":
                            if (p.tim != nil) {
                                Image(uiImage: "https://i.4cdn.org/\(boardTitle)/\(p.tim!).jpg".load())
                            }
                           
                        default:
                            Text("")
                        }
                    }
                    if (p.com != nil) {
                        Text("\(p.com!)")
                    }

                }
            }
            }
        }.onAppear() {
            postsL = getPosts(boardTitle, threadId)
            playerMap = [Int : AVPlayer]()
            
            if playerMap == nil {
                print("nil")
            } else {
                print("ne nil")
            }
//            for po in postsL!.posts {
//                print(type(of: playerMap))
//                playerMap![postsL!.posts.firstIndex(of: po) ?? 0] = AVPlayer()
//            }
            showPosts = true
        }
        
    }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(threadId: 55, boardTitle: "a")
    }
}

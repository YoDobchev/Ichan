//
//  ContentView.swift
//  IOS 4chan
//
//  Created by Yoan Dobchev on 7.09.21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var boardsArr : boardsA?
    @State var showList = false
    @State var showThreadView = false
    @State var boardTitle = "aa"
//    @State var player = AVPlayer(url: URL(string: "http://localhost:4444/convert/wsg/1631415790861")!)
    var body: some View {
        NavigationView {
        VStack {
//            ScrollView {
                if showList {
                    List((boardsArr?.boards)!, id: \.self) { bo in
                        Button(action: {
                            showThreadView = true
                            boardTitle = bo.board
                        }) {
                            Text("\(bo.title) - /\(bo.board)/")
                                .foregroundColor(.red)
                        }
                    }
                }
//            }
            NavigationLink(
                destination: ThreadView(boardTitle: self.boardTitle, threadId: 55), isActive: $showThreadView) {
                
            }
            
//            VideoPlayer(player: player)
//            Button(action: {
//                player = AVPlayer(url: URL(string: "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4")!)
//                player.play()
////                VideoPlayer(player: AVPlayer(url: URL(string: "http://localhost:4444/convert/wsg/1631415790861")!)) {
////                    Text("video")
////                        .font(.caption)
////                        .foregroundColor(.white)
////                        .background(Color.black.opacity(0.7))
////                        .clipShape(Capsule())
////                        Spacer()
////                }
//
//            }) {
//                Text("click")
//            }
            
        }.onAppear() {
            boardsArr = getBoards()!
            showList = true
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

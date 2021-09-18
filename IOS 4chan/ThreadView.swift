//
//  ThreadView.swift
//  IOS 4chan
//
//  Created by Yoan Dobchev on 15.09.21.
//

import SwiftUI

extension String {
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            let data : Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        return UIImage()
    }
}

struct ThreadView: View {
    var boardTitle : String
    @State var threadArr : Array<thread>?
    @State var showThreads = false
    @State var showPostView = false
    @State var threadId : Int64
    var body: some View {
        
            GeometryReader { geometry in
                NavigationView {
                ScrollView(.vertical) {
        VStack {
            if showThreads {
                ForEach((threadArr!), id: \.self) { th in
                    ForEach((th.threads!), id: \.self) { t in
                        VStack {
                            
                                Button(action: {
                                    threadId = t.no
                                    showPostView = true
                                }) {
                                    if ((t.tim) != nil) {
                                    Image(uiImage: "https://i.4cdn.org/\(boardTitle)/\(t.tim!)s.jpg".load())
                                    }
                                    
                                }
                            if (t.sub != nil) {
                                Text("\(t.sub!)")
                                    .fontWeight(.bold)
                            }
                            
                            if (t.com != nil) {
                            Text("\(t.com!)")
                                .padding(.horizontal)
                            }
                                
                            
                        }
                        
                        .frame(width: geometry.size.width, alignment: .center)
                        .border(Color.green)
                    }
                }
            }
        }.onAppear() {
            threadArr = getThreads("\(boardTitle)")
            showThreads = true
            
            
        }
    }
                    
                }.navigationBarTitleDisplayMode(.inline)
    }
        NavigationLink(
            destination: PostView(threadId: self.threadId, boardTitle: boardTitle, playerMap: nil), isActive: $showPostView) {
            
        }
    }
}

struct ThreadView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadView(boardTitle: "a", threadArr: nil, threadId: 55)
    }
}

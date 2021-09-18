//
//  threads.swift
//  IOS 4chan
//
//  Created by Yoan Dobchev on 7.09.21.
//

import Foundation
import AVKit

struct thread : Codable, Hashable {
    var page : Int8?
    var threads : Array<threadInfo>?
}
struct threadInfo: Codable, Hashable {
    var no : Int64
    var name : String?
    var sub : String?
    var com : String?
    var ext : String?
    var replies : Int16?
    var tim : Int64?
//    var last_replies : Array<threadLR>?
//    var last_modified : Int64?
}
//struct threadLR : Codable, Hashable {
//    var no : Int64
//}
struct posts : Codable, Hashable {
    var posts : Array<post>
}
struct post : Codable, Hashable {
    var no : Int64
    var now : String
    var name : String?
    var sub : String?
    var com : String?
    var filename : String?
    var ext : String?
    var w : Int16?
    var h : Int16?
    var th_w : Int16?
    var th_h : Int16?
    var tim : Int64?
    var time : Int32
    var replies : Int32?
    var resto : Int32?
    var fsize : Int32?
    
}
struct boardsA : Codable {
    var boards : Array<board>
}
struct board : Codable , Hashable {
    var board : String
    var title : String
}
//class Api : ObservableObject{
//    @Published var books = [thread]()
//
//    func loadData(completion:@escaping ([thread]) -> ()) {
//        guard let url = URL(string: "https://a.4cdn.org/wsg/threads.json") else {
//            print("Invalid url...")
//            return
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            let books = try! JSONDecoder().decode([thread].self, from: data!)
//            print(books)
//            DispatchQueue.main.async {
//                completion(books)
//            }
//        }.resume()
//
//    }
//}

//
//  threadsRequest.swift
//  IOS 4chan
//
//  Created by Yoan Dobchev on 11.09.21.
//

import Foundation

func unEscape(_ escapedHTLM : String) -> String {
    var unEscapedHtml = escapedHTLM
    unEscapedHtml = unEscapedHtml.replacingOccurrences(of: "<br>", with: "")
    return unEscapedHtml
}

func getBoards() -> boardsA? {
    let urlString = "https://a.4cdn.org/boards.json"
    let url = URL(string: urlString)
    guard url != nil else {
        return nil
    }
    let session = URLSession.shared
    var threadFINAL : boardsA!
    let dataTask = session.dataTask(with: url!) { data, response, error in
        if error == nil && data != nil {
            let decoder = JSONDecoder()
            do {
            let threadRF = try decoder.decode(boardsA.self, from: data!)
            threadFINAL = threadRF
            } catch {
                print("greshka pri parsvaneto")
            }
        }
    }
    
    dataTask.resume()
    while true {
        if (threadFINAL != nil) {
            return threadFINAL
        }
    }
}
func getThreads(_ board : String) -> Array<thread>? {
    let urlString = "https://a.4cdn.org/\(board)/catalog.json"
    let url = URL(string: urlString)
    guard url != nil else {
        return nil
    }
    let session = URLSession.shared
    var threadFINAL : Array<thread>!
    let dataTask = session.dataTask(with: url!) { data, response, error in
        if error == nil && data != nil {
            let decoder = JSONDecoder()
            do {
            let threadRF = try decoder.decode([thread].self, from: data!)
            threadFINAL = threadRF
            } catch {
                print(error)
            }
        }
    }
    
    dataTask.resume()
    while true {
        if (threadFINAL != nil) {
            return threadFINAL
        }
    }
}
func getPosts(_ board : String, _ id : Int64) -> posts? {
    let urlString = "https://a.4cdn.org/\(board)/thread/\(id).json"
    let url = URL(string: urlString)
    guard url != nil else {
        return nil
    }
    let session = URLSession.shared
    var threadFINAL : posts!
    let dataTask = session.dataTask(with: url!) { data, response, error in
        if error == nil && data != nil {
            let decoder = JSONDecoder()
            do {
            let threadRF = try decoder.decode(posts.self, from: data!)
            threadFINAL = threadRF
            } catch {
                print(error)
            }
        }
    }
    
    dataTask.resume()
    while true {
        if (threadFINAL != nil) {
            return threadFINAL
        }
    }
}
//struct threadsRequest {
//    let resourceURL : URL
//    init(board:String) {
//        let resourceString = "https://a.4cdn.org/\(board)/threads.json"
//        guard let resourceURL = URL(string: resourceString) else {fatalError()}
//        self.resourceURL = resourceURL
//    }
//
//    func getThreads (completion: @escaping (Result<[threadInfo], Error>) -> Void) {
//        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
//            let jsonData = data
//            do {
//            let decoder = JSONDecoder()
//            let threadResponse = try decoder.decode(thread.self, from: jsonData!)
//                let threadDet = threadResponse
//                completion(.success(threadDet.threads))
//            }catch{
//                completion(.failure(fatalError()))
//            }
//        }
//        dataTask.resume()
//    }
//
//}

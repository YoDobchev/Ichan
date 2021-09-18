//
//  Test.swift
//  IOS 4chan
//
//  Created by Yoan Dobchev on 16.09.21.
//

import SwiftUI


struct Test: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
        HStack {
            VStack {
                Image(uiImage: "https://media4.giphy.com/media/RtdRhc7TxBxB0YAsK6/giphy.gif".load())
            }.frame(minWidth: geo.size.width * 0.5)
            
            
            

            
        }
            HStack {
            
            }
        }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

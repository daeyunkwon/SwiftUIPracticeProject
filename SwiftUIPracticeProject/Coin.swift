//
//  Coin.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/3/24.
//

import Foundation

class Coin: ObservableObject, Identifiable {
    let id = UUID().uuidString
    let name: String
    let subName: String
    let imageName: String
    @Published var like: Bool = false
    
    init(name: String, subName: String, imageName: String) {
        self.name = name
        self.subName = subName
        self.imageName = imageName
    }
}

var coinDummy = [
    Coin(name: "Bitcoin", subName: "BTC", imageName: "star"),
    Coin(name: "Ethereum", subName: "ETH", imageName: "person"),
    Coin(name: "Ripple", subName: "XRP", imageName: "pencil"),
    Coin(name: "Litecoin", subName: "LTC", imageName: "heart"),
    Coin(name: "Ravencoin", subName: "RVN", imageName: "paperplane.fill"),
    Coin(name: "Bitcoin", subName: "BTC", imageName: "star"),
    Coin(name: "Ethereum", subName: "ETH", imageName: "person"),
    Coin(name: "Ripple", subName: "XRP", imageName: "pencil"),
    Coin(name: "Litecoin", subName: "LTC", imageName: "heart"),
    Coin(name: "Ravencoin", subName: "RVN", imageName: "paperplane.fill"),
    Coin(name: "Bitcoin", subName: "BTC", imageName: "star"),
    Coin(name: "Ethereum", subName: "ETH", imageName: "person"),
    Coin(name: "Ripple", subName: "XRP", imageName: "pencil"),
    Coin(name: "Litecoin", subName: "LTC", imageName: "heart"),
    Coin(name: "Ravencoin", subName: "RVN", imageName: "paperplane.fill"),
]

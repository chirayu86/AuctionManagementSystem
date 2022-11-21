//
//  Buyer.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

struct Address:Codable {
    
    let state:String
    let city:String
    let pincode:Int
}

class Buyer:Codable{
    
    let userName:String
    let name:String
    var boughtItemList:[Item] = []
    var bidList:[Int:Bid] = [:]
    let address:Address
    let pin: Int
   
    init(userName: String, name: String, address: Address, pin: Int) {
        self.userName = userName
        self.name = name
        self.address = address
        self.pin = pin
    }
    
    
}

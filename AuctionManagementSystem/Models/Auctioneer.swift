//
//  Auctioneer.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation


class Auctioneer : Staff {
    
    let name :String
    let id : Int
    let password: String
    
    init(name: String, id: Int, password: String) {
        self.name = name
        self.id = id
        self.password = password
    }
}

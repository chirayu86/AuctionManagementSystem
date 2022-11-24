//
//  Bid.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

class Bid {
    
    let amount: Float
    let buyerUsername:String
    let auctionId:Int
    
    init(amount: Float, buyerUsername: String, auctionId: Int) {
       
        self.amount = amount
        self.buyerUsername = buyerUsername
        self.auctionId = auctionId

    }
    
}

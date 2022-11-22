//
//  Auction.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation


enum AuctionStatus {
    
    case open,
         
         unbid,
       
         closed
    
}

class Auction {
    
    let id :Int
    let auctionItem:Item
    var currentHighestBid:Bid?
    var status:AuctionStatus
    var auctionLog: [String] = []
    var winner:String = ""
    
    
    init(auctionItem: Item) {
       
        self.id = auctionItem.id
        self.auctionItem = auctionItem
        self.currentHighestBid = nil
        self.status = AuctionStatus.unbid
        
    }
    
}

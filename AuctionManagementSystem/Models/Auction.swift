//
//  Auction.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

class Auction {
    
    let id :Int
    let auctionItem:Item
    var currentHighestBid:Bid?
    var status:AuctionStatus
    
    init(auctionItem: Item) {
        self.id = auctionItem.id
        self.auctionItem = auctionItem
        self.currentHighestBid = nil
        self.status = AuctionStatus.unbid
    }
    
}

//
//  PrintHelper.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

class PrintHelper {
    

private func printDottedLine(_ char: Character) {
        for _ in 0..<100 {
            print(char,terminator: "")
        }
        print()
    }
    
   
    
    func printMessage(_ message: Message) {
        printDottedLine("-")
        print(message.rawValue)
        printDottedLine("-")
    }
    
  
    func printAuction(_ auction: Auction) {
      
        print("""
                
                
                ----------------------------------------------------------
                id : \(auction.id)
                -----------------------------------------------------------
                the auction is for item \(auction.auctionItem.name)
                 Description: \(auction.auctionItem.description)
                 Baseprice: \(auction.auctionItem.basePrice)
                 current higest bid: \(auction.currentHighestBid?.amount ?? 0)
                ------------------------------------------------------------
                
                
                """
              )
        
    }
    
  
    
    func printItem(_ item:Item) {
        
        print(item.id,item.name,item.category,item.basePrice,item.isSold,item.description,separator: "    ")
    }
   
    
    func printBid(_ bid:Bid) {
        
        print(bid.buyerUsername,bid.amount,bid.auctionId,separator: "    ")
        
    }
    
    
}

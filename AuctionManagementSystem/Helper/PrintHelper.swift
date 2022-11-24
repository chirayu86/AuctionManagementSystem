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
    
  
    
    func printAuctionLog(_ auctionLog: [String]) {
        
        guard auctionLog.isEmpty == false else {
            print("log is empty")
            return
        }
        auctionLog.forEach {
            log in  printDottedLine("-")
            print(log)
        }
    }
    
  
    func printAuction(_ auction: Auction) {
      
        print("""
                ===================================================================================================
                  id : \(auction.id)
                ---------------------------------------------------------------------------------------------------
                 Item Name: \(auction.auctionItem.name)
                
                 Description: \(auction.auctionItem.description)
                 Baseprice:  \(auction.auctionItem.basePrice)
                
                 highest bid: \(auction.currentHighestBid?.amount ?? 0)
                
                 Winner:  \(auction.winner)
                
                ======================AuctionLog====================================================================
                """
              )
                printAuctionLog(auction.auctionLog)
                printDottedLine("=")
    
        
    }
    
  
    
    func printItem(_ item:Item) {
          
        print(
              item.id.description.padding(toLength: 4, withPad: " ", startingAt: 0),
              item.name.padding(toLength: 15, withPad: " ", startingAt: 0),
              item.basePrice.description.padding(toLength: 10, withPad: " ", startingAt: 0),
              item.sellingPrice.description.padding(toLength: 7, withPad: " ", startingAt: 0),
              item.status.rawValue,item.description.padding(toLength: 25, withPad: " ", startingAt: 0),separator: "    ")
       
        printDottedLine("-")
    }
   
    
   
    func printBid(_ bid:Bid) {
        
        print(bid.buyerUsername,bid.amount,bid.auctionId,separator: "      ")
        
    }
    
    
}

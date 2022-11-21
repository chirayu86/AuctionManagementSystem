//
//  AuctioneerServices.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

enum AuctionErrors:Error {

    case closeActiveAuctionFirst
    
    case noSuchItemFound
    
    case itemAlreadySold
    
    case auctionAlreadyClosed

}

class AuctioneerServices: UserServices {
    
    let input = InputHelper()

    let auctioneer : Auctioneer
  
    
    func generateAuction()throws {
     
        let auction = dataBase.getAuction()
        guard auction == nil || auction?.status != AuctionStatus.closed else {
            
            throw AuctionErrors.closeActiveAuctionFirst
        }
            
            print("enter the id of item you want to start the auction for")
            let id = input.getInteger(readLine())
          
            guard let item = dataBase.getItem(id) else {
                throw AuctionErrors.noSuchItemFound
            }
            
            guard item.isSold != true else {
                throw AuctionErrors.itemAlreadySold
            }
           
            dataBase.activeAuction = Auction(auctionItem: item)
            
        
    }
    
  
    func closeAuction()throws {
        let auction = try getActiveAuction()
        
        guard auction.status != AuctionStatus.closed else {
            
            throw AuctionErrors.auctionAlreadyClosed
        }
        
        guard auction.status != AuctionStatus.unbid else {
           
            auction.status = AuctionStatus.closed
            print("current auction closed")
            return
            
        }
        
        if auction.status == AuctionStatus.open {
            let buyerList = dataBase.getBuyerDict()
        
            guard let winner = buyerList[auction.currentHighestBid!.buyerUsername] else {
             
                assertionFailure("there must be a buyer")
                return
            }
            
          
            auction.auctionItem.isSold = true
            winner.boughtItemList.append(auction.auctionItem)
            
        }
    }
  
    
 
    
    init(_ auctioneer: Auctioneer) {
        
       self.auctioneer = auctioneer
        
    }
    
    
}

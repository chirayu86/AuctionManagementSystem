//
//  AuctioneerServices.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

enum AuctionError:Error {

    case closeActiveAuctionFirst
    
    case noSuchItemFound
    
    case alreadyAuctioned
    
    case auctionAlreadyClosed
    
    case buyerNotFound

}

enum AuctionLogMessage:String {
    
    case auctionClosedwithoutBid = "auction was closed without a bid"
    
    case auctionClosedWithBid = "the item has been sold to the highest bidder"
}



class AuctioneerService: UserServices {
    
    let input = InputHelper()

    let auctioneer : Auctioneer
  
    init(_ auctioneer: Auctioneer) {
        
       self.auctioneer = auctioneer
        
    }
    
  
    
    func generateAuction()throws {
     
        let auction = dataBase.getAuction()
        
        guard auction == nil || auction?.status == AuctionStatus.closed else {
            
            throw AuctionError.closeActiveAuctionFirst
        }
            
            print("enter the id of item you want to start the auction for")
            let id = input.getInteger(readLine())
          
            guard let item = dataBase.getItem(id) else {
                
                throw AuctionError.noSuchItemFound
            }
            
      
        guard item.status == ItemStatus.drafted else {
                
                throw AuctionError.alreadyAuctioned
            }
        
       
            item.status = ItemStatus.published
             
            let newAuction = Auction(auctionItem: item)
        
            dataBase.setAuction(newAuction)
            
        
    }
    
    
    
  
    func closeAuction()throws {
     
        let auction = try getActiveAuction()
        
   
        
        guard auction.status != AuctionStatus.closed else {
            
            throw AuctionError.auctionAlreadyClosed
        }
        
   
    
        
        guard auction.status != AuctionStatus.unbid else {
           
            auction.status = AuctionStatus.closed
            
            auction.auctionItem.status = ItemStatus.unsold
            
            auction.auctionLog.append(AuctionLogMessage.auctionClosedwithoutBid.rawValue)
            
            dataBase.addToCompeletedAuction(auction)
        
            return
            
        }
        
      
        
        
        if auction.status == AuctionStatus.open {
           
           
            let buyerList = dataBase.getBuyerDict()
            
           
        
            guard let bid = auction.currentHighestBid else {
            
                assertionFailure("there must be a current higest bid if the auction is open")
                return
            }
            
          
            guard  let winner = buyerList[bid.buyerUsername] else {
                
                assertionFailure("biding user should be present in database")
                return
            }
          
            
            auction.auctionItem.status = ItemStatus.sold
            
       
            auction.auctionItem.sellingPrice = bid.amount //+ auction.auctionItem.tax
           
        
            winner.boughtItemList.append(auction.auctionItem)
            
          
            auction.auctionLog.append(AuctionLogMessage.auctionClosedWithBid.rawValue)
            
          
            auction.winner = winner.userName
            
        
            auction.status = AuctionStatus.closed
            
          
            dataBase.addToCompeletedAuction(auction)
            
        }
    }
  
    
    
}

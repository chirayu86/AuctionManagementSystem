//
//  BuyerServices.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation
enum BiddingError:Error {
   
    case auctionClosed
    
    case bidShouldbBeHigher
}


class BuyerService:UserServices {
    
    let input = InputHelper()
    
    let buyer : Buyer
    
   
    
    init(buyer: Buyer) {
        
        self.buyer = buyer
    }
    

  
    
    private func generateLog(_ bid:Bid)->String {
        
        return "\(buyer.userName) has placed a bid on auction id:\(bid.auctionId) for amount \(bid.amount)"
        
    }
    
  
  

    
   
    private func generateBid(_ auction: Auction)throws->Bid {
     
        guard auction.status !=  AuctionStatus.closed else {
            
            throw BiddingError.auctionClosed
        }
        
        print("enter your bid amount should be greater than the base price and current highest bid")
        let amount = input.getFloatingPoint(readLine())
        
        guard amount>auction.auctionItem.basePrice && amount>auction.currentHighestBid?.amount ?? 0 else {
           
            throw BiddingError.bidShouldbBeHigher
        }
       
      return Bid(amount: amount, buyerUsername: buyer.userName, auctionId: auction.id)
      
    }
    

    
   
    
    func placeBid()throws {
               
            let auction = try getActiveAuction()
           
            let bid = try generateBid(auction)
            
            auction.currentHighestBid = bid
             
            buyer.bidList[bid.auctionId] = bid
        
            let log = generateLog(bid)
        
            auction.auctionLog.append(log)
            
      
        if auction.status == AuctionStatus.unbid {
        
            auction.status = AuctionStatus.open
        }
         
            
        
}
    

   
    
    func checkBidsPlaced()->[Bid] {
        
        let bidDict = buyer.bidList
        var BidList:[Bid] = []
        
        bidDict.values.forEach {
          
            bid in BidList.append(bid)
        }
        
        return BidList
    }
    
   
   
    
    func checkBoughtItems()->[Item] {
       
        return buyer.boughtItemList
        
    }
    
    
    
}

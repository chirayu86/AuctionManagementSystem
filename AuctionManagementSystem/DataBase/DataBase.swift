//
//  DataBase.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 16/11/22.
//

import Foundation
class DataBase {
    
   var activeAuction: Auction? = nil
    
  static let sharedDb = DataBase()
    
  private let  auctioneer = Auctioneer(name: "atul", id: 101, password: "12")
  
  private let auctionManager = AuctionManager(name: "mehul", id: 102, password: "1234")
    
  private  var buyerDict:[String:Buyer] = ["chirayu@86":Buyer(userName: "chirayu@86", name: "chirayu", address: Address(state: "M.P", city: "DEWAS", pincode: 455001), pin: 1234)]
    
    private var itemDict:[Int:Item] = [123:Item(id: 123, name: "jas", description: "dasjfh", basePrice: 200, category: ItemCategory.antique),21:Item(id: 21, name: "dsai", description: "dsfjh", basePrice: 1400, category: ItemCategory.unUsed)]
    
    private init() {

}
    
    func getAuction()->Auction? {
        
        return activeAuction
    }
    
  
    func getauctioneer()->Auctioneer {
        
        return auctioneer
    }
    
   
    func getauctionManager()->AuctionManager {
        
        return auctionManager
    }

    
// item dict functions
    func getItemDict()->[Int:Item] {
        
        return itemDict
    }
    
   
    func storeItemToDataBase(_ item:Item) {
        
        itemDict[item.id] = item
    }
    
 
    func getItem(_ id:Int)->Item? {
        
        return itemDict[id]
    }

    
//    buyer dictonary functions
  
    func storeBuyertoDataBase(_ buyer:Buyer) {
       
        buyerDict[buyer.userName] = buyer
    }
    
    
    func getBuyerDict()->[String:Buyer] {
        
        return buyerDict
    }
    
    
}

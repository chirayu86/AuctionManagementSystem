//
//  DataBase.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 16/11/22.
//

import Foundation
class DataBase {
    
    private var currentAuction: Auction? = nil
    
   
    static let sharedDb = DataBase()
    
    
    private let  auctioneer = Auctioneer(name: "atul", id: 101, password: "12")
    
    
    private let auctionManager = AuctionManager(name: "mehul", id: 102, password: "1234")
    
    
    private  var buyerDict:[String:Buyer] = [
    
    "chirayu@86":Buyer(userName: "chirayu@86", name: "chirayu", address: Address(state: "M.P", city: "DEWAS", pincode: 455001), pin: 1234),
     "lol@90":Buyer(userName: "lol@90", name: "lol singh", address: Address(state: "TN", city: "chennai", pincode: 600062), pin: 1122),
     "tanmay@21":Buyer(userName: "tanmay@21", name: "tanmay", address: Address(state: "GOA", city: "GOA", pincode: 213452), pin: 212)
    ]
    
    
    private var itemDict:[Int:Item] = [
        123:Item(id: 123, name: "sword", description: "mugal sword", basePrice: 200000, category:          ItemCategory.antique),
       
        21:Item(id: 21, name: "chain", description: "metal chain", basePrice: 1400, category: ItemCategory.unUsed),
        
        34:Item(id: 34, name: "the stary light", description: "by vincent van goh", basePrice: 8000, category: ItemCategory.artifact),
        
        989:Item(id: 989, name: "mona lisa", description: "by da vinci", basePrice: 2300, category: ItemCategory.artifact),
        
        322:Item(id: 322, name: "pen", description: "old parker pen", basePrice: 200, category: ItemCategory.used)
    ]
    
    
    private var completedAuctions: [Auction] = []
    
   
    private init() {
        
    }
 
   
    
    //auction functions
    
    func getCompletedAuction()->[Auction] {
        
        return completedAuctions
    }
    
 
    func addToCompeletedAuction(_ auction:Auction) {
        
        completedAuctions.append(auction)
    }
    

    
    func getAuction()->Auction? {
        
        return currentAuction
    }
    
    
    func setAuction(_ auction:Auction) {
        
        currentAuction = auction
    }
    
    
    // staff functions
    func getauctioneer()->Auctioneer {
        
        return auctioneer
    }
    
    
    
    func getauctionManager()->AuctionManager {
        
        return auctionManager
    }
    
    
//    item dict functions
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

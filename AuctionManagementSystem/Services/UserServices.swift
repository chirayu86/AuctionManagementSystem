//
//  UserServices.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation


class UserServices {
    
    let dataBase = DataBase.sharedDb
    
      func previewItems()->[Item] {
        
        let itemDict = dataBase.getItemDict()
        var itemList:[Item] = []
        
        itemDict.values.forEach {
           
            item in itemList.append(item)
        }
        
        return itemList
    }
    
    
      func getActiveAuction()throws->Auction {
        
        guard let auction = dataBase.getAuction()  else {
            
            throw DataBaseError.noActiveAuction
        }
        
        return auction
    }
    
}

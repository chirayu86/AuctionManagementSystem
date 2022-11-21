//
//  ValidationHelper.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 17/11/22.
//

import Foundation

class ValidationHelper {
    
    let dataBase = DataBase.sharedDb

    
    
    func isUserNameAvailable(_ userName: String)throws {
         
        let buyerDict = dataBase.getBuyerDict()
        
        guard buyerDict.keys.contains(userName) == false else {
            
            throw ValidationError.userNameAlreadyTaken
        }
        
}
    
    
    func isItemIdValid(_ id:Int)->Bool {
        
        let itemDict = dataBase.getItemDict()
        
        guard itemDict.keys.contains(id) == false else {
            
            return false
        }
        
        return true
        
}
  
    
}

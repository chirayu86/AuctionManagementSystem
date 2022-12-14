//
//  LoginService.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 17/11/22.
//

import Foundation

enum LoginError:Error {
    
    case invalidPassword
    
    case noUserFound
    
}


class LoginService {
    
    let input = InputHelper()
    let dataBase = DataBase.sharedDb
    let printHelper = PrintHelper()
    
  
    func buyerlogin()throws->Buyer {
        
        let buyerDictonary = dataBase.getBuyerDict()
        
        printHelper.printMessage(Message.buyerLogin)
        
        let userName = input.getNonEmptyString(readLine())
        let pin = input.getInteger(readLine())
        
        guard let buyer = buyerDictonary[userName] else {
               
            throw LoginError.noUserFound
        }
        
        guard buyer.pin == pin else {
            
            throw LoginError.invalidPassword
        }
        
        return buyer
}
    
    
    
    func auctioneerLogin()throws->Auctioneer {
        
        printHelper.printMessage(Message.staffLogin)
        let password = input.getNonEmptyString(readLine())
        
       
        let auctioneer = dataBase.getauctioneer()
        
      
        guard auctioneer.password == password else {
            
            throw LoginError.invalidPassword
        }
            
        return auctioneer
}
    
   
  
    func auctionManagerLogin()throws->AuctionManager {
        
        printHelper.printMessage(Message.staffLogin)
        let password = input.getNonEmptyString(readLine())
        
      
        let auctionManager = dataBase.getauctionManager()
        
       
        guard auctionManager.password == password else {
        
            throw LoginError.invalidPassword
        }
        
       
        return auctionManager
}
    
    
}

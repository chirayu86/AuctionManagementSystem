//
//  MenuMessage.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

enum Message:String {
    
    
    //MISC MESSAGES
    case selectItemCategory = """
                               1.item is used
                               2.new item
                               3.antique item
                               4.artifact
                             """
    
    
    //MAIN MENU MESSAGES
    case mainMenu = """
                      1.customer login
                      2.staff login
                     """
 
    case staffLoginMenu = """
                          1.Auctioneer login
                          2.Auction Manager login
                          3.main menu
                          """
 
    case buyerLoginMenu = """
                             1.login
                             2.register
                             3.mainMenu
                             """
    
    case auctionManagerMenu = """
                              1.add item
                              2.check unsold items
                              4.main menu
                             """
    
    case auctioneerMenu = """
                          1.generate new auction
                          2.close auction
                          3.main menu
                          """
  
    case buyerMenu = """
                     1.place bid
                     2.check bought items
                     3.check placed bids
                     4.main menu
                     """
    
    case buyerRegistrationScreen = "enter your details and register"
                                    
    
    case buyerLoginScreen = "enter your userName and 4 digit pin"
    
    case staffLoginScreen = "enter your password"
    

    case itemListHeader = "ID    NAME    CATEGORY    BASEPRICE    SOLD    DESCRIPTION"
    
    case bidListHeader = "USERNAME    AMOUNT    AUCTIONID"
}



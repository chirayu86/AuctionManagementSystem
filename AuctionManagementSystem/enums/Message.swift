//
//  MenuMessage.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//


enum Message:String {
    
    
    //MISC MESSAGES
    case selectItemCategory = """
                               1.item is used
                               2.new item
                               3.antique item
                               4.artifact
                             """
    
    case selectItemStatus = """
                            1.drafted
                            2.unsold
                            3.sold
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
                              3.check completed auctions
                              4.main menu
                             """
    
    case auctioneerMenu = """
                          1.generate new auction
                          2.close auction
                          3.main menu
                          """
  
    case buyerMenu = """
                     1.place bid
                     2.my menu
                     3.main menu
                     """
 
    case buyerSubMenu = """
                         1.check bought items
                         2.check placed bids
                         3.return to buyer menu
                         """
   
   
    case buyerRegistration = "enter your details and register"
                                    
    
   
    case buyerLogin = "enter your userName and 4 digit pin"
    
  
    case staffLogin = "enter your password"
    

    case itemListHeader = "ID      NAME            BASEPRICE        SOLDFOR        STATUS      DESCRIPTION"
    
   
    case bidListHeader = "USERNAME     AMOUNT     AUCTIONID"
    
   
    case activeAuction = "ACTIVE AUCTION------------"
    
 
    case itemUpForAuction = "Items Up For auction------"
}



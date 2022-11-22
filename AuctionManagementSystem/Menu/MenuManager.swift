//
//  loginMenu.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

enum MainMenu:Int {
    
    case buyerLogin = 1,
         
        staffLogin
    
    
}

enum BuyerLoginMenu: Int {
    case login=1,
         register,
         mainMenu
}


enum StaffLoginMenu: Int {
    
    case auctioneer = 1,
         auctionManager,
         mainMenu
}



enum BuyerMenu: Int {
    
    case placeBid = 1,
         subMenu ,
         mainMenu
}


enum BuyerSubMenu: Int {
    
    case checkBoughtItems = 1,
          checkPlacedBids,
          buyerMenu
}

enum AuctioneerMenu:Int {
    
    case generateAuction = 1,
         closeAuction,
         mainMenu
}

enum AuctionManagerMenu:Int {
    
    case addItem = 1,
         checkItemWithStatus,
         checkCompletedAuction,
         mainMenu
    
}

class MenuManager {
    
    let input = InputHelper()
    let printer = PrintHelper()
  
    func mainMenu() {
        
        printer.printMessage(Message.mainMenu)
        let choice = input.getIntegerInRange(readLine(),2)
        switch MainMenu(rawValue: choice) {
        
        case .buyerLogin:
            buyerLoginMenu()
       
        case .staffLogin:
            staffLoginMenu()
        default:
            mainMenu()
   
        }
        
}
  
    func buyerLoginMenu() {
        
        printer.printMessage(Message.buyerLoginMenu)
        
        let choice = input.getIntegerInRange(readLine(), 3)
        
        switch BuyerLoginMenu(rawValue: choice)  {
            
        case .login:
            buyerLoginScreen()
            
        case .register:
            buyerRegistrationScreen()
            
        case .mainMenu:
            mainMenu()
            
        default:
            buyerLoginMenu()
      }
        
        
}
    
    
    func buyerLoginScreen() {
       
        let loginService = LoginService()
    
        do {
            let buyer = try loginService.buyerlogin()
            buyerMenu(buyer)
        } catch {
            print(error)
            buyerLoginMenu()
        }
   
}
   
    
    func buyerRegistrationScreen() {
      
        let register = BuyerRegistrationService()
       
        printer.printMessage(Message.buyerRegistration)
        register.registerBuyer()
        
        buyerLoginMenu()
}

    
  
  
    func staffLoginMenu() {
        
        let loginService = LoginService()
        
        printer.printMessage(Message.staffLoginMenu)
        let choice = input.getIntegerInRange(readLine(),3)
        
        do {
            switch StaffLoginMenu(rawValue: choice) {
                
            case .auctioneer:
                let auctioneer = try loginService.auctioneerLogin()
                auctioneerMenu(auctioneer)
                
            case .auctionManager:
                let auctionManager = try loginService.auctionManagerLogin()
                auctionManagerMenu(auctionManager)
                
            case .mainMenu:
                mainMenu()
                
           default:
                staffLoginMenu()
            }
        } catch {
            print(error)
            staffLoginMenu()
    }

        
}
            
       
        
        
        

    func activeAuctionAndItemList() {
    
        let service = UserServices()
        

        printer.printMessage(Message.activeAuction)
    
        // Print active auction with auction log on screen
        do {
           
            let auction = try service.getActiveAuction()
            printer.printAuction(auction)
      
        } catch {
            
            print()
            print(error)
            print()
        }
    
        
        printer.printMessage(Message.itemUpForAuction)
     
        // print items to be auctioned today on screen
        printer.printMessage(Message.itemListHeader)
        let itemList = service.previewItems()
        itemList.forEach {
            
            item in printer.printItem(item)
        }
        
    
        
    }
    
   
    func buyerMenu(_ buyer: Buyer) {
        
        let service = BuyerService(buyer: buyer)
        
        
        func subMenu() {
            
            printer.printMessage(Message.buyerSubMenu)
            
            let choice = input.getIntegerInRange(readLine(), 3)
            
            switch BuyerSubMenu(rawValue: choice) {
            case .checkBoughtItems:
               
                let boughtItemList = service.checkBoughtItems()
                
                printer.printMessage(Message.itemListHeader)
             
                boughtItemList.forEach {
                    
                    item in printer.printItem(item)
                    
                }
                    
           
            case .checkPlacedBids:
                   
                let bidList = service.checkBidsPlaced()
                    printer.printMessage(Message.bidListHeader)
                    
                    bidList.forEach {
                        
                        bid in printer.printBid(bid)
                        
                    }
           
            case .buyerMenu:
               
                buyerMenu(buyer)
            
            default:
                
                subMenu()
                
            }
            
            subMenu()
            
    }
        
        
        
        activeAuctionAndItemList()
        
        printer.printMessage(Message.buyerMenu)
        
        let choice = input.getIntegerInRange(readLine(), 3)
        do {
            
            switch BuyerMenu(rawValue: choice) {
                
            case .placeBid:
                  try service.placeBid()
                
            case .subMenu:
                    subMenu()
                
            case .mainMenu:
                  mainMenu()
                
            default:
                buyerMenu(buyer)
                
            }
        } catch {
            
            print(error)
        }
        
        buyerMenu(buyer)
        
    }
    
    
    

    
   
    func auctioneerMenu(_ auctioneer: Auctioneer) {
        
        let service = AuctioneerService(auctioneer)
      
        activeAuctionAndItemList()
  
        

        printer.printMessage(Message.auctioneerMenu)
        let choice = input.getIntegerInRange(readLine(), 4)
        
        do {
            switch AuctioneerMenu(rawValue: choice) {
                
            case .generateAuction:
                
               try service.generateAuction()
                
            case .closeAuction:
                
              try service.closeAuction()
                
            case .mainMenu:
                
                mainMenu()
                
            default:
                auctioneerMenu(auctioneer)
            }
        } catch {
            print(error)
        }
       
        auctioneerMenu(auctioneer)
        
    }
    
  
    
   
    func auctionManagerMenu(_ auctionManager: AuctionManager) {
        
      let service = AuctionManagerService(auctionManager)
  
        
        activeAuctionAndItemList()
        
        printer.printMessage(Message.auctionManagerMenu)
        let choice = input.getIntegerInRange(readLine(), 4)
        
        switch AuctionManagerMenu(rawValue: choice) {
            
        case .addItem:
            
            service.addItemForAuction()
            
        case .checkItemWithStatus:
            
           let itemList = service.checkItems()
            
            printer.printMessage(Message.itemListHeader)
           
            itemList.forEach {
               
                item in printer.printItem(item)
            }
            
        case .checkCompletedAuction:
            
            let auctionList = service.checkCompletedAuctions()
           
            auctionList.forEach {
               
                auction in printer.printAuction(auction)
            }
            
        case .mainMenu:
            
            mainMenu()
            
        default:
            auctionManagerMenu(auctionManager)
        }
        
        auctionManagerMenu(auctionManager)
    }
}

//
//  loginMenu.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

class MenuManager {
    
    let input = InputHelper()
    let printer = PrintHelper()
  
    func mainMenu() {
        
        printer.printMessage(Message.mainMenu)
        let choice = input.getIntegerInRange(readLine(),2)
        switch choice {
        case 1:
            buyerLoginMenu()
        case 2:
            staffLoginScreen()
        default:
            mainMenu()
    }
        
}
  
    func buyerLoginMenu() {
        
        printer.printMessage(Message.buyerLoginMenu)
        
        let choice = input.getIntegerInRange(readLine(), 3)
        
        switch choice {
            
        case 1:
            buyerLoginScreen()
        case 2:
            buyerRegistrationScreen()
        case 3:
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
       
        printer.printMessage(Message.buyerRegistrationScreen)
        register.registerBuyer()
        
        buyerLoginMenu()
}

    
  
  
    func staffLoginScreen() {
        
        let loginService = LoginService()
        
        printer.printMessage(Message.staffLoginMenu)
        let choice = input.getIntegerInRange(readLine(),3)
        
        do {
            switch choice {
            case 1:
                let auctioneer = try loginService.auctioneerLogin()
                auctioneerMenu(auctioneer)
            case 2:
                let auctionManager = try loginService.auctionManagerLogin()
                auctionManagerMenu(auctionManager)
            case 3:
                mainMenu()
           default:
                staffLoginScreen()
            }
        } catch {
            print(error)
            staffLoginScreen()
    }

        
}
            
       
        
        
        

    func activeAuctionAndItemList() {
    
        let service = UserServices()
        
        
       // Print active auction on screen
        do {
           
            let auction = try service.getActiveAuction()
            printer.printAuction(auction)
      
        } catch {
            
            print()
            print(error)
            print()
        }
        //print auction log on screen
        
        // print items to be auctioned today on screen
        printer.printMessage(Message.itemListHeader)
        let itemList = service.previewItems()
        itemList.forEach {
            item in printer.printItem(item)
        }
        
    
        
    }
    
   
    func buyerMenu(_ buyer: Buyer) {
        
      let service = BuyerServices(buyer: buyer)
        
        activeAuctionAndItemList()
        
        printer.printMessage(Message.buyerMenu)
        let choice = input.getIntegerInRange(readLine(), 4)
        do {
            switch choice {
                
            case 1:
                try service.placeBid()
            case 2:
                let boughtItemList = service.checkBoughtItems()
                printer.printMessage(Message.itemListHeader)
             
                boughtItemList.forEach {
                    item in printer.printItem(item)
                    
                }
            case 3:
                let bidList = service.checkBidsPlaced()
                printer.printMessage(Message.bidListHeader)
                
                bidList.forEach {
                    bid in printer.printBid(bid)
                }
            case 4:
                mainMenu()
            default:
                buyerMenu(buyer)
                
            }
        } catch {
            print(error)
            buyerMenu(buyer)
        }
        
        buyerMenu(buyer)
        
    }
    
    
   
    func auctioneerMenu(_ auctioneer: Auctioneer) {
        
        let service = AuctioneerServices(auctioneer)
      
        activeAuctionAndItemList()

        printer.printMessage(Message.auctioneerMenu)
        let choice = input.getIntegerInRange(readLine(), 4)
        
        do {
            switch choice {
                
            case 1:
               try service.generateAuction()
            case 2:
              try service.closeAuction()
            case 3:
                mainMenu()
            default:
                auctioneerMenu(auctioneer)
            }
        } catch {
            print(error)
            auctioneerMenu(auctioneer)
        }
       
        auctioneerMenu(auctioneer)
        
    }
    
  
    
   
    func auctionManagerMenu(_ auctionManager: AuctionManager) {
        
      let service = AuctionManagerService(auctionManager)
  
        
        activeAuctionAndItemList()
        
        printer.printMessage(Message.auctionManagerMenu)
        let choice = input.getIntegerInRange(readLine(), 4)
        
        switch choice {
            
        case 1:
            service.addItemForAuction()
        case 2:
            mainMenu()
        default:
            auctionManagerMenu(auctionManager)
        }
        auctionManagerMenu(auctionManager)
    }
}

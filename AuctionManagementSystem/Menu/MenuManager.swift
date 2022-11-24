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
         previewItems,
         buyerMenu
}

enum AuctioneerMenu:Int {
    
    case generateAuction = 1,
         closeAuction,
         mainMenu
}

enum AuctionManagerMenu:Int {
    
    case addItem = 1,
         subMenu,
         mainMenu
    
}


enum AuctionManagerSubMenu: Int {
    
    case checkItemWithStatus = 1,
         checkCompletedAuction,
         previewItems,
         auctionManagerMenu
}


class MenuManager {
    
    let input = InputHelper()
    let printHelper = PrintHelper()
    
    func mainMenu() {
        
        printHelper.printMessage(Message.mainMenu)
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
        
        printHelper.printMessage(Message.buyerLoginMenu)
        
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
        
        printHelper.printMessage(Message.buyerRegistration)
        register.registerBuyer()
        
        buyerLoginMenu()
    }
    
    
    
    
    func staffLoginMenu() {
        
        let loginService = LoginService()
        
        printHelper.printMessage(Message.staffLoginMenu)
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
    
    
    
    
    
    
    func activeAuction() {
        
        let service = UserServices()
        
        // Print active auction with auction log on screen
        printHelper.printMessage(Message.activeAuction)
        do {
            
            let auction = try service.getActiveAuction()
            printHelper.printAuction(auction)
            
        } catch {
            
            print(error)
            
        }
        
        
}
        
        
        
    
    
    func itemList() {
        
        let service = UserServices()
        
        printHelper.printMessage(Message.itemUpForAuction)
        printHelper.printMessage(Message.itemListHeader)
        let itemList = service.previewItems()
        
        itemList.forEach {
            item in printHelper.printItem(item)
        }
    }
    
    
    
    
    
    func buyerMenu(_ buyer: Buyer) {
        
        let service = BuyerService(buyer: buyer)
        
        activeAuction()
        
        printHelper.printMessage(Message.buyerMenu)
        
        let choice = input.getIntegerInRange(readLine(), 3)
        do {
            
            switch BuyerMenu(rawValue: choice) {
                
            case .placeBid:
                try service.placeBid()
                
            case .subMenu:
                buyerSubMenu(buyer)
                
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
    
    
    func buyerSubMenu(_ buyer: Buyer) {
        
        let service = BuyerService(buyer: buyer)
        
        printHelper.printMessage(Message.buyerSubMenu)
        
        let choice = input.getIntegerInRange(readLine(), 4)
        
        switch BuyerSubMenu(rawValue: choice) {
            
        case .checkBoughtItems:
            
            let boughtItemList = service.checkBoughtItems()
            
            printHelper.printMessage(Message.itemListHeader)
            
            boughtItemList.forEach {
                
                item in printHelper.printItem(item)
                
            }
            
            
        case .checkPlacedBids:
            
            let bidList = service.checkBidsPlaced()
            printHelper.printMessage(Message.bidListHeader)
            
            bidList.forEach {
                
                bid in printHelper.printBid(bid)
                
            }
        case .previewItems:
                
                    itemList()
            
        case .buyerMenu:
            
            buyerMenu(buyer)
            
        default:
            
            buyerSubMenu(buyer)
            
        }
        
        buyerSubMenu(buyer)
        
    }
    
    
    
    func auctioneerMenu(_ auctioneer: Auctioneer) {
        
        let service = AuctioneerService(auctioneer)
        
        activeAuction()
        
        printHelper.printMessage(Message.auctioneerMenu)
        let choice = input.getIntegerInRange(readLine(), 4)
        
        do {
            switch AuctioneerMenu(rawValue: choice) {
                
            case .generateAuction:
                itemList()
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
        
        
        activeAuction()
        
        printHelper.printMessage(Message.auctionManagerMenu)
        let choice = input.getIntegerInRange(readLine(), 4)
        
        switch AuctionManagerMenu(rawValue: choice) {
            
            
        case .addItem:
            
            service.addItemForAuction()
            
            
        case .subMenu:
            auctionManagerSubMenu(auctionManager)
            
        case .mainMenu:
            
            mainMenu()
            
            
        default:
            auctionManagerMenu(auctionManager)
        }
        
        auctionManagerMenu(auctionManager)
    }
    
   
    
    func auctionManagerSubMenu(_ auctionManager:AuctionManager) {
        
        let service = AuctionManagerService(auctionManager)
        
        printHelper.printMessage(Message.auctionManagerSubMenu)
        let choice = input.getIntegerInRange(readLine(),4)
        
        switch AuctionManagerSubMenu(rawValue: choice) {
            
        case .checkItemWithStatus:
            
            let itemList = service.checkItems()
            
            printHelper.printMessage(Message.itemListHeader)
            
            itemList.forEach {
                
                item in printHelper.printItem(item)
            }
            
            
        case .checkCompletedAuction:
            
            let auctionList = service.checkCompletedAuctions()
            
            guard auctionList.isEmpty ==  false else {
              
                print("no auctions completed yet")
              
                break
            }
           
            auctionList.forEach {
                
                auction in printHelper.printAuction(auction)
            }
            
        case .previewItems:
                   
                   itemList()
                
        case .auctionManagerMenu:
               
                auctionManagerMenu(auctionManager)
            
       
            
        default:
            
            auctionManagerSubMenu(auctionManager)
            
        }
        
        auctionManagerSubMenu(auctionManager)
    }
    
}

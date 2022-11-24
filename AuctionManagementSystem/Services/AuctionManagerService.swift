//
//  AuctionManagerService.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 18/11/22.
//

import Foundation

class AuctionManagerService :UserServices {
    
    let auctionManager : AuctionManager
    
    init(_ auctionManager : AuctionManager) {
        
        self.auctionManager =  auctionManager
}
    
    let input = InputHelper()
    
        
    
    func addItemForAuction() {
        
        let itemGenerator = ItemGenerationService()
        
        let item = itemGenerator.generateItem()
        
        dataBase.storeItemToDataBase(item)
        
        print("item added successfully")
    }
    
    
    
 
    
    
    private func selectItemStatus()->ItemStatus {
        
        let printer = PrintHelper()
        
        printer.printMessage(Message.selectItemStatus)
        let choice = input.getIntegerInRange(readLine(), 3)
        
        switch choice {
        case 1:
            return ItemStatus.drafted
        case 2:
            return ItemStatus.unsold
        case 3:
            return ItemStatus.sold
        default:
            return ItemStatus.unsold
        }
        
    }
    
    
    
    func checkItems()->[Item] {
        
        let itemList = previewItems()
       
        let status = selectItemStatus()
        
        var specificList:[Item] = []
        
        for item in itemList {
            
            if item.status == status {
               
                specificList.append(item)
            }
        }
        return specificList
        
    }
    
    
    
    
    func checkCompletedAuctions()->[Auction]  {
        
        return dataBase.getCompletedAuction()
    }
   
    
    
  
    
    
}

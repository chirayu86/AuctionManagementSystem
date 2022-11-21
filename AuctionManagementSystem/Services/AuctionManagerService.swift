//
//  AuctionManagerService.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 18/11/22.
//

import Foundation

class AuctionManagerService :UserServices {
    
    let input = InputHelper()
    
    
    class ItemGenerationService {
        
        let input = InputHelper()
        
        
        private func generateUniqueId()->Int    {
            
            let validator = ValidationHelper()
            
            let number = arc4random_uniform(100)*arc4random_uniform(100)
            
            guard validator.isItemIdValid(Int(number)) else {
                
                return generateUniqueId()
            }
            
            return Int(number)
}
        
        
        
        private func selectItemCategory()->ItemCategory {
            
            let printer = PrintHelper()
            
            printer.printMessage(Message.selectItemCategory)
            let choice = input.getIntegerInRange(readLine(), 4)
            
            return ItemCategory(rawValue: choice) ?? ItemCategory.used
            
}
        
        
        
        func generateItem()->Item {
            
            
            print("enter the name of item")
            let name = input.getNonEmptyString(readLine())
            print("enter the basePrice of item")
            let basePrice = input.getFloatingPoint(readLine())
            print("select item category")
            let category = selectItemCategory()
            print("add a item description")
            let desc = input.getNonEmptyString(readLine())
            
            let id = generateUniqueId()
            
            return Item(id: id,name:name,description: desc, basePrice: basePrice, category: category)
            
            
    }
        
}

    
    
    let auctionManager : AuctionManager
    
    
    
    func addItemForAuction() {
        
        let itemGenerator = ItemGenerationService()
        
        let item = itemGenerator.generateItem()
        
        dataBase.storeItemToDataBase(item)
        
    }
    
    
    init(_ auctionManager : AuctionManager) {
        
        self.auctionManager =  auctionManager
}
    
}
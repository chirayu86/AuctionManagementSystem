//
//  ItemGenerationService.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 23/11/22.
//

import Foundation



class ItemGenerationService {
    
    let input = InputHelper()
    
    
     private func generateUniqueId()->Int    {
        
        let registerationHelper = RegistrationHelper()
         
         let number = (0...999).randomElement()!
            
        guard registerationHelper.isItemIdAvailable(number) else {
            
            return generateUniqueId()
        }
        
        return number
         
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


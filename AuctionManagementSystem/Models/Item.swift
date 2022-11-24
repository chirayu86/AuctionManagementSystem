//
//  Item.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

enum ItemCategory:Int,Codable {
    
    case used = 1
    
    case unUsed
    
    case antique
    
    case artifact
    
}


enum ItemStatus:String,Codable {
    
    case drafted = "drafted"
    
    case published =  "ongoing"
    
    case sold = "-sold--"
    
    case unsold = "unsold"
}

class Item:Codable {
    
    let id:Int
    let name:String
    let description:String
    let basePrice:Float
    let category: ItemCategory
    var status: ItemStatus = ItemStatus.drafted
    var sellingPrice:Float = 0

   
    var tax: Float {
       get {
           switch category {
          
           case .used:
               return basePrice * 0.1
           case .unUsed:
               return basePrice * 0.2
           case .antique:
               return basePrice * 0.3
           case .artifact:
               return  basePrice * 0.25
               
           }
        }
    }
    
  
    init(id: Int,name:String,description: String, basePrice: Float, category: ItemCategory) {
      
        self.id = id
        self.name = name
        self.description = description
        self.basePrice = basePrice
        self.category = category
        
    }
}

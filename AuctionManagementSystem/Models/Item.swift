//
//  Item.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 15/11/22.
//

import Foundation

class Item:Codable {
    
    let id:Int
    let name:String
    let description:String
    let basePrice:Float
    let category: ItemCategory
    var isSold: Bool = false

    var commision: Float {
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

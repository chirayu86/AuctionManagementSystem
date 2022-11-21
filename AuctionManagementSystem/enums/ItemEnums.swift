//
//  ItemCategoryEnum.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 18/11/22.
//

import Foundation

enum ItemCategory:Int,Codable {
    
    case used = 1
    
    case unUsed 
    
    case antique
    
    case artifact
    
}

enum ItemStatus {
    
    case drafted
    
    case sold
    
    case unsold
}

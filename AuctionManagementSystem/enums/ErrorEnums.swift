//
//  ErrorEnum.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 16/11/22.
//

import Foundation

enum ValidationError:Error {
    
      case userNameAlreadyTaken
    
      case noActiveAuction
    
}

enum LoginError:Error {
    
    case invalidPassword
    
    case noUserFound
    
}

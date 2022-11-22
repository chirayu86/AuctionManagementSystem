//
//  ValidationHelper.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 16/11/22.
//

import Foundation

class InputHelper {
    
  
    func getNonEmptyString(_ input: String?)->String {
        
        guard  let unwrappedInput = input else {
            
            print("nil value found pls enter again")
            return  getNonEmptyString(readLine())
            
        }
      
        
       
        guard  unwrappedInput.isEmpty == false else {
            
            print("pls enter a value in input")
            return getNonEmptyString(readLine())
            
        }
        
        return unwrappedInput
     }
    
    
 
    func getInteger(_ input: String?)->Int {
        
        let nonEmptyInput = getNonEmptyString(input)
        
        guard let integerInput =  Int(nonEmptyInput) else {
            
            print("pls enter an integer value")
            return getInteger(readLine())
            
        }
        
        return integerInput
    }
    
    
 
    func getIntegerInRange(_ input:String?,_ range: Int)->Int {
        
        let checkedInput = getInteger(input)
        
        guard checkedInput <= range else {
            
            print("pls enter a value in range of \(range)")
            return getIntegerInRange(readLine(), range)
            
        }
        
        return checkedInput
    }
    
  
  
    func getFloatingPoint(_ string:String?)->Float {
        
        let nonEmptyString = getNonEmptyString(string)
        
        guard let floatInput = Float(nonEmptyString) else  {
            
            print("enter a floating point number")
            return getFloatingPoint(readLine())
        }
        
        return floatInput
     }
    
 

    func getName(_ input: String?)->String {
     
        let nonEmptyString = getNonEmptyString(input)
        let regEx = ".*[^A-Za-z ].*"
        
        guard nonEmptyString.range(of: regEx ,options: .regularExpression) == nil else {
            
            print("no numerics or special characters allowed")
            return getName(readLine())
        }
        
        return nonEmptyString
    }
    
 
    
    
    
}

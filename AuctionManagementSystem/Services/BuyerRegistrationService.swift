//
//  UserRegistration.swift
//  AuctionManagementSystem
//
//  Created by chirayu-pt6280 on 17/11/22.
//

import Foundation

class BuyerRegistrationService {
    
    let input = InputHelper()
    let database =  DataBase.sharedDb
    let registerationHelper = RegistrationHelper()
    
    func registerBuyer() {
       
        do
        {
            print("enter your username")
            let userName = input.getNonEmptyString(readLine())
            try registerationHelper.isUserNameAvailable(userName)
            
            print("enter your name")
            let name = input.getName(readLine())
            
            print("enter the pin you want to set")
            let pin = input.getInteger(readLine())
            
            print("----------Address-Details---------------------")
            
            print("enter your state name")
            let state = input.getName(readLine())
            
            print("enter your city name")
            let city = input.getName(readLine())
            
            print("enter your pincode")
            let pincode = input.getInteger(readLine())
            
            let address = Address(state: state, city: city, pincode: pincode)
            
            let buyer = Buyer(userName: userName, name: name, address: address,pin: pin)
            database.storeBuyertoDataBase(buyer)
            
            print("successfully registered")
            
        } catch {
           
            print(error)
            registerBuyer()
            
        }
    }
}

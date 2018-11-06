//
//  RegistrationViewModelFromReg.swift
//  AutomatedTesting
//
//  Created by Khairul on 11/3/18.
//  Copyright © 2018 Khairul. All rights reserved.
//

import UIKit

class RegistrationViewModelFromReg:RegistrationViewModel {
    
    let networkService:NetworkService
    
    init(networkservice:NetworkService) {
        self.networkService = networkservice
    }
    
    var emailAddress: String?{
        didSet{
            enableRegistrationAttempt()
        }
    }
    
    var passWord: String?{
        didSet{
            enableRegistrationAttempt()
        }
    }
    
    var passwordConfirmation: String?{
        didSet{
            enableRegistrationAttempt()
        }
    }
    
    var registrationEnabled: Dynamic<Bool> = Dynamic(false)
    var registrationSuccessful:Dynamic<Bool> = Dynamic(false)
    var registrationFailureMessage: Dynamic<String> = Dynamic("")
    var registrationSuccesssMessage: Dynamic<String> = Dynamic("Registration Successfully")
    
    func attemptUserRegistration()
    {
        guard  self.registrationEnabled.value == true else {return}
        
        guard let emailaddress = emailAddress,
            let password = passWord else {return}
        
        networkService.attemptForuserRegistration(emailaddress, password) { (status, error) in
            if let _ = error
            {
                self.registrationFailureMessage.value = "Registration failed"
            }
            else
            {
                self.registrationSuccessful.value = true
            }
        }
    }
    
    func enableRegistrationAttempt()
    {
        registrationEnabled.value = emailValid() && passwordValid()
    }
    
    func emailValid() -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailAddress)
    }
    
    func passwordValid() -> Bool
    {
        guard let password = passWord,
            let passwordConfirmation = passwordConfirmation else {
                return false
        }
        let isValid = (password == passwordConfirmation) &&
            password.count >= 6
        return isValid
    }
    
    func checkEmailAvailability(email:String ,  withCallback callback: @escaping (Bool?)->(Void))
    {
        networkService.checkemailAvailability(email) { (response, error) in
            if let _ = error
            {
                self.registrationFailureMessage.value = "Wrong Email"
            }
            else if !response
            {
                self.registrationEnabled.value = false
            }
            callback(response)
        }
    }
}

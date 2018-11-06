//
//  RegistrationViewModel.swift
//  AutomatedTesting
//
//  Created by Khairul on 11/3/18.
//  Copyright © 2018 Khairul. All rights reserved.
//

import UIKit

protocol RegistrationViewModel
{
    var emailAddress:String? {get set}
    var passWord:String? {get set}
    var passwordConfirmation:String? {get set}
    var registrationEnabled:Dynamic<Bool> {get set}
    var registrationSuccessful:Dynamic<Bool>{get set}
    var registrationFailureMessage:Dynamic<String>{get set}
    var registrationSuccesssMessage:Dynamic<String>{get set}
    func attemptUserRegistration()
}

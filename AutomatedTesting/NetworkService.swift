
//
//  NetworkService.swift
//  AutomatedTesting
//
//  Created by Khairul on 11/3/18.
//  Copyright © 2018 Khairul. All rights reserved.
//

import UIKit

typealias RegistrationSuccessful = (_ success:Bool,_ error:Error?) -> ()
typealias EmailAvailability = (_ isAvailable:Bool,_ error:Error?) ->()

protocol NetworkService
{
    func attemptForuserRegistration(_ email:String,_ password:String,callBack:@escaping RegistrationSuccessful)
    func checkemailAvailability(_ email:String,callBack:@escaping EmailAvailability)
}

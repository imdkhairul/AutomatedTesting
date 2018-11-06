//
//  NetworkServiceImpl.swift
//  AutomatedTesting
//
//  Created by Khairul on 11/3/18.
//  Copyright © 2018 Khairul. All rights reserved.
//

import UIKit

class NetworkServiceImpl: NSObject ,NetworkService{
    func attemptForuserRegistration(_ email: String, _ password: String, callBack: @escaping RegistrationSuccessful) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            callBack(true,nil)
        }
    }
    
    func checkemailAvailability(_ email: String, callBack: @escaping EmailAvailability) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            callBack(true,nil)
        }
    }
}

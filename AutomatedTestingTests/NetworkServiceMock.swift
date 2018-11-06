//
//  NetworkServiceMock.swift
//  AutomatedTestingTests
//
//  Created by Khairul Islam on 11/4/18.
//  Copyright © 2018 Khairul. All rights reserved.
//

import UIKit

class NetworkServiceMock: NetworkService {
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

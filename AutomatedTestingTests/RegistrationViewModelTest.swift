//
//  RegistrationViewModelTest.swift
//  AutomatedTestingTests
//
//  Created by Khairul Islam on 11/4/18.
//  Copyright © 2018 Khairul. All rights reserved.
//

import XCTest

class RegistrationViewModelTest: XCTestCase {

    var registrationViewModel:RegistrationViewModelFromReg?
    var testExpectation:XCTestExpectation?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        registrationViewModel = RegistrationViewModelFromReg.init(networkservice:NetworkServiceMock())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        registrationViewModel = nil
    }
    
    func testEmailValid(){
    
        registrationViewModel?.emailAddress = "sfdfd@"
        XCTAssertFalse((registrationViewModel?.emailValid())!, "\((registrationViewModel?.emailAddress)!) shouldn't be valid")
        
        registrationViewModel?.emailAddress = "www.cafd.com"
        XCTAssertFalse((registrationViewModel?.emailValid())!, "\((registrationViewModel?.emailAddress)!) shouldn't be valid")
        
        registrationViewModel?.emailAddress = "123455"
        XCTAssertFalse((registrationViewModel?.emailValid())!, "\((registrationViewModel?.emailAddress)!) shouldn't be valid")
        
        registrationViewModel?.emailAddress = "@.com"
        XCTAssertFalse((registrationViewModel?.emailValid())!, "\((registrationViewModel?.emailAddress)!) shouldn't be valid")
        
        registrationViewModel?.emailAddress = "abc@gmail.com"
        XCTAssert((registrationViewModel?.emailValid())!, "\((registrationViewModel?.emailAddress)!) should be valid")
        
    }
    
    func testcheckEmailAvailability()
    {
        let exp = expectation(description: "Check Email Availablity")
        registrationViewModel?.registrationEnabled.value = true
        registrationViewModel?.checkEmailAvailability(email: "abc@gmail.com", withCallback: { (available) -> (Void) in
            XCTAssert(self.registrationViewModel?.registrationEnabled.value == true,"Email not available")
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 3.0) {
            error in
            if let _ = error {
                XCTAssert(false, "Timeout while checking email availability")
            }
        }
    }
    
    func testAttemptRegistration()
    {
        let exp = expectation(description: "Check Registration")
        registrationViewModel?.emailAddress = "abc@gmail.com"
        registrationViewModel?.passWord = "123456"
        registrationViewModel?.passwordConfirmation = "123456"
        registrationViewModel?.attemptUserRegistration()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            XCTAssert((self.registrationViewModel?.registrationSuccessful.value)!, "Registration Successful")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 4.0) { (error) in
            if let _ = error {
                XCTAssert(false, "Timeout while Registration")
            }
        }
    }
}

//
//  RegistrationUITest.swift
//  AutomatedTestingUITests
//
//  Created by Khairul Islam on 11/6/18.
//  Copyright © 2018 Khairul. All rights reserved.
//

import XCTest

class RegistrationUITest: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        
    }
    
    func testRegistrationButtonEnabled(){
        
        let registerButton = XCUIApplication().buttons["Register"]
        
        let emailTextField = XCUIApplication().textFields["emailTextField"]
        emailTextField.tap()
        emailTextField.typeText("abc@gmail.com")
        XCTAssert((registerButton.isEnabled == false),"Register Button Should not enabled")
        
        let passwordTextField = XCUIApplication().secureTextFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        XCTAssert((registerButton.isEnabled == false),"Register Button Should not enabled")
        
        let confirmpasswordTextField = XCUIApplication().secureTextFields["confirmpassword"]
        confirmpasswordTextField.tap()
        confirmpasswordTextField.typeText("123456")
        
        XCTAssert(registerButton.isEnabled, "Register Button Should enabled")
        registerButton.tap()
    }
    
    
}

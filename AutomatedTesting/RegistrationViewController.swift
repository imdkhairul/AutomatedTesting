//
//  RegistrationViewController.swift
//  AutomatedTesting
//
//  Created by Khairul on 11/5/18.
//  Copyright © 2018 Khairul. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    private struct TextFieldTags {
        static let emailTextField = 100
        static let passwordTextField = 101
        static let confirmPasswordTextField = 102
    }
    
    var registrationViewModel:RegistrationViewModelFromReg?{
        didSet{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPassTextField.delegate = self
        // Do any additional setup after loading the view.
        bindViewModel()
    }

    func bindViewModel()
    {
        registrationViewModel?.registrationEnabled.bindAndFire({ [weak self] (isEnabled) in
            self?.registerButton.isEnabled = isEnabled
        })
    }
    @IBAction func registerButtonPressed(_ sender: Any)
    {
        registrationViewModel?.attemptUserRegistration()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let viewModel = registrationViewModel else {
            return true
        }
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        switch textField.tag {
        case TextFieldTags.emailTextField: viewModel.emailAddress = newString
        case TextFieldTags.passwordTextField: viewModel.passWord = newString
        case TextFieldTags.confirmPasswordTextField: viewModel.passwordConfirmation = newString
        default:
            break
        }
        return true
    }
}

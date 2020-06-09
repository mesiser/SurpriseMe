//
//  CodeVerificationViewController.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import UIKit

class CodeVerificationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var thirdTextField: UITextField!
    @IBOutlet var fourthTextField: UITextField!
    
    var phoneNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instructionsLabel.text?.append("\n" + phoneNumber!)
        setUpTextFieldDelegates()
        firstTextField.becomeFirstResponder()
    }
    
    @IBAction func sendAgainButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

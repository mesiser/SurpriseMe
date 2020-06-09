//
//  EnterTheCodeViewController.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import UIKit

class EnterTheCodeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var firstTextField: CodeTextField!
    @IBOutlet var secondTextField: CodeTextField!
    @IBOutlet var thirdTextField: CodeTextField!
    @IBOutlet var fourthTextField: CodeTextField!
    
    var phoneNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instructionsLabel.text?.append("\n" + phoneNumber!)
        setUpDelegates()
        firstTextField.becomeFirstResponder()
    }
    
    @IBAction func sendAgainButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

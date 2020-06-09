//
//  EnterTheCode.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import UIKit

extension EnterTheCodeViewController {
    
    func setUpDelegates() {
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self
        firstTextField.addTarget(self, action: #selector(firstTextFieldDidChange), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(secondTextFieldDidChange), for: .editingChanged)
        thirdTextField.addTarget(self, action: #selector(thirdTextFieldDidChange), for: .editingChanged)
        fourthTextField.addTarget(self, action: #selector(fourthTextFieldDidChange), for: .editingChanged)
    }
    
    @objc func firstTextFieldDidChange(_ textField: UITextField) {
        print("First text field tapped")
        firstTextField.endEditing(true)
        secondTextField.borderStyle = .line
        secondTextField.becomeFirstResponder()
    }
    
    @objc func secondTextFieldDidChange(_ textField: UITextField) {
        print("Second text field tapped")
        secondTextField.endEditing(true)
        thirdTextField.borderStyle = .line
        thirdTextField.becomeFirstResponder()
    }
    
    @objc func thirdTextFieldDidChange(_ textField: UITextField) {
        print("Third text field tapped")
        thirdTextField.endEditing(true)
        fourthTextField.borderStyle = .line
        fourthTextField.becomeFirstResponder()
    }
    
    @objc func fourthTextFieldDidChange(_ textField: UITextField) {
        print("Fourth text field tapped")
        fourthTextField.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
}

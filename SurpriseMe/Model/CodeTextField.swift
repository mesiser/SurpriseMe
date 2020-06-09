//
//  CodeTextField.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import UIKit

class CodeTextField: UITextField {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        if textField.text != nil {
            if ((textField.text?.count)! + (string.count - range.length)) > 1 {
                return false
            }
        }
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

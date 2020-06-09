//
//  UpdatePhoneNumber.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import UIKit

extension MainViewController {
    func updatePhoneNumber() {
        phoneNumber = nil
        guard phoneTextField.text != nil, phoneTextField.text!.count == 14 else { return }
        phoneNumber = phoneTextField.text!
    }
}

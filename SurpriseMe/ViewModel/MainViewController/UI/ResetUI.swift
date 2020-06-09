//
//  ResetUI.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import UIKit

extension MainViewController {
    func resetUI() {
        phoneTextField.text = nil
        phoneTextField.endEditing(true)
        attractionImageView.alpha = 1
        attractionDescription.alpha = 1
        topConstraint.constant = (UIScreen.main.bounds.size.width > 600) ? 40 : 20
        bottomConstraint.constant = (UIScreen.main.bounds.size.width > 600) ? 40 : 20
    }
}

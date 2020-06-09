//
//  FreeSpaceForKeyboard.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func freeSpaceForKeyBoard() {
        UIView.animate(withDuration: 1) {
            self.attractionImageView.alpha = 0
            self.attractionDescription.alpha = 0
            self.topConstraint.constant = (UIScreen.main.bounds.size.width > 600) ? -360 : -180
            self.bottomConstraint.constant = (UIScreen.main.bounds.size.width > 600) ? 440 : 220
        }
    }
}

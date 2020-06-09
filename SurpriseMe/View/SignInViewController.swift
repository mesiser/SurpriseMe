//
//  SignInViewController.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet var phoneLogo: UIImageView!
    @IBOutlet var googleLogo: UIImageView!
    @IBOutlet var appleLogo: UIImageView!
    @IBOutlet var facebookLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadLogos()
    }
    
    func uploadLogos() {
        LogoImages.uploadLogos(withName: "Phone", for: phoneLogo)
        LogoImages.uploadLogos(withName: "Google", for: googleLogo)
        LogoImages.uploadLogos(withName: "Apple", for: appleLogo)
        LogoImages.uploadLogos(withName: "Facebook", for: facebookLogo)
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func alternativeSignInButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("Signing in with phone")
        case 1:
            print("Signing in with Google")
        case 2:
            print("Signing in with Apple")
        default:
            print("Signing in with Facebook")
        }
        self.dismiss(animated: true, completion: nil)
    }
}

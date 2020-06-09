//
//  ViewController.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 08.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import UIKit
import SKCountryPicker

class MainViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var attractionImageView: UIImageView!
    @IBOutlet var attractionDescription: UILabel!
    @IBOutlet var chooseYourCountryButton: ShadowButton!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var areaCode: UILabel!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var greetingsLabel: UILabel!
    
    var phoneNumber: String?
    let user = UserCredentials()
    
    let fontSize: CGFloat = (UIScreen.main.bounds.size.width > 600) ? 50 : 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.delegate = self
        setUpMainViewController()
    }
    
    //MARK:- Choosing a country
    
    @IBAction func chooseYourCountryButtonPressed(_ sender: UIButton) {
        
        let countryPicker = CountryPickerWithSectionViewController.presentController(on: self) { [weak self] (country: Country) in
            guard let self = self else { return }
            self.areaCode.text = country.dialingCode ?? "us"
            if let pickedCountryFlag = CountryFlag().getEmojiFlag(for: "\(country.countryCode)") {
                self.updateCountryFlag(with: pickedCountryFlag)
            }
        }
        countryPicker.flagStyle = .circular
    }
    
    //MARK:- Entering the phone number
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        freeSpaceForKeyBoard()
    }
    
    //MARK:- Navigation
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        updatePhoneNumber()
        guard  phoneNumber != nil else { return }
        PostRequest().prepareRequest(userID: user.userID, userPhone: phoneNumber!)
        resetUI()
        performSegue(withIdentifier: "enterTheCode", sender: self)
    }
    
    @IBAction func signInAsDifferentPersonButtonTapped(_ sender: UIButton) {
        print("Sign in as different person button tapped")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enterTheCode" {
            let destination = segue.destination as! CodeVerificationViewController
            destination.phoneNumber = phoneNumber!
        }
    }
}

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
        uploadImage()
        updateGreetingsLabel()
        updateCountryFlag(with: "🇺🇸")
    }
    
    //MARK:- Setting up UI
    
    func uploadImage() {
        attractionImageView.getImage(from: "https://app.surprizeme.ru/media/store/1186_i1KaYnj_8DuYTzc.jpg")
    }
    
    func updateGreetingsLabel() {
        greetingsLabel.text?.append(user.userName + " !")
    }
    
    //NB! См. комментарий 1 в конце файла
    
    func updateCountryFlag(with flag: String) {
        chooseYourCountryButton.setAttributedTitle(NSAttributedString(string: flag + " ", attributes: [NSAttributedString.Key.font : UIFont(name: "Font Awesome 5 Free", size: fontSize)!, NSAttributedString.Key.foregroundColor : UIColor.black]), for: .normal)
    }
    
    //MARK:- Choosing a country
    
    @IBAction func chooseYourCountryButtonPressed(_ sender: UIButton) {
        
        let countryPicker = CountryPickerWithSectionViewController.presentController(on: self) { [weak self] (country: Country) in
            guard let self = self else { return }
            self.areaCode.text = country.dialingCode ?? "us"
            if let pickedCountryFlag = CountryFlag().getEmojiFlag(regionCode: "\(country.countryCode)") {
                self.updateCountryFlag(with: pickedCountryFlag)
            }
        }
        countryPicker.flagStyle = .circular
    }
    
    //MARK:- Entering the phone number
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        freeSpaceForKeyBoard()
    }
    
    func freeSpaceForKeyBoard() {
        UIView.animate(withDuration: 1) {
            self.attractionImageView.alpha = 0
            self.attractionDescription.alpha = 0
            self.topConstraint.constant = (UIScreen.main.bounds.size.width > 600) ? -360 : -180
            self.bottomConstraint.constant = (UIScreen.main.bounds.size.width > 600) ? 440 : 220
        }
    }
    
    //MARK:- Navigation
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        updatePhoneNumber()
        guard  phoneNumber != nil else { return }
        resetUI()
        performSegue(withIdentifier: "enterTheCode", sender: self)
    }
    
    func updatePhoneNumber() {
        phoneNumber = nil
        guard phoneTextField.text != nil, phoneTextField.text!.count == 14 else { return }
        phoneNumber = phoneTextField.text!
    }
    
    func resetUI() {
        phoneTextField.text = nil
        phoneTextField.endEditing(true)
        attractionImageView.alpha = 1
        attractionDescription.alpha = 1
        topConstraint.constant = (UIScreen.main.bounds.size.width > 600) ? 40 : 20
        bottomConstraint.constant = (UIScreen.main.bounds.size.width > 600) ? 40 : 20
    }
    
    @IBAction func signInAsDifferentPersonButtonTapped(_ sender: UIButton) {
        print("Sign in as different person button tapped")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enterTheCode" {
            let destination = segue.destination as! EnterTheCodeViewController
            destination.phoneNumber = phoneNumber!
        }
    }
    
}

//MARK:- Комментарии

// 1. Обновление флага страны на viewDidLoad необходимо, чтобы учесть размеры экрана (iPad/iPhone) и использовать правильный размер шрифта. Дело в том, что storyboard не позволяет указывать разные размера шрифта NSAttributedString для разных экранов, если этот NSAttributedString является заголовком UIButton.

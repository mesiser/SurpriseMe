//
//  SetUpMainViewController.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

//MARK:- Setting up UI for MainViewController

import UIKit

extension MainViewController {
    
    func setUpMainViewController() {
        uploadImage()
        updateGreetingsLabel()
        updateCountryFlag(with: "🇺🇸")
    }
    
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
}

//MARK:- Комментарии

// 1. Обновление флага страны на viewDidLoad необходимо, чтобы учесть размеры экрана (iPad/iPhone) и использовать правильный размер шрифта. Дело в том, что storyboard не позволяет указывать разные размера шрифта NSAttributedString для разных экранов, если этот NSAttributedString является заголовком UIButton.

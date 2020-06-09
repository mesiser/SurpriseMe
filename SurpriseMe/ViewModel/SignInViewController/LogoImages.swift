//
//  LogoImages.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import UIKit

struct LogoImages {
    
    static var logosArray : [UIImage] = []
    
    static func uploadLogos(withName: String, for imageView: UIImageView) {
        let logos = ["Phone" : "https://www.sampsoncollaborativelaw.com/wp-content/uploads/2018/05/phone-1-300x300.png", "Google" : "https://www.shareicon.net/data/256x256/2015/10/04/111650_google-icon_512x512.png", "Apple" : "https://upload.wikimedia.org/wikipedia/commons/7/70/Logo_Apple.inc.gif", "Facebook" : "https://sun3-13.userapi.com/c858224/v858224682/dddab/BqR1dyp7F8k.jpg"]
        if let url = logos[withName] {
            imageView.getImage(from: url)
        }
    }
}

//
//  CountryFlag.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 08.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import Foundation

class CountryFlag {
    
    func getEmojiFlag(regionCode: String) -> String? {
        let code = regionCode.uppercased()

        guard Locale.isoRegionCodes.contains(code) else {
            return nil
        }

        var flagString = ""
        for s in code.unicodeScalars {
            guard let scalar = UnicodeScalar(127397 + s.value) else {
                continue
            }
            flagString.append(String(scalar))
        }
        return flagString
    }
}

//
//  PostRequest.swift
//  SurpriseMe
//
//  Created by Vadim Shalugin on 09.06.2020.
//  Copyright © 2020 Vadim Shalugin. All rights reserved.
//

import Foundation
import Alamofire

class PostRequest {
    
    func prepareRequest(userID: Int, userPhone: String) {
        let url = URL(string: "https://webhook.site/4e88daa3-ddc5-436e-9659-993660603103")!
        let parameters : [String: Any] = ["userID" : userID, "userPhone" : userPhone]
        sendPostRequest(with: parameters, to: url)
    }
    
    func sendPostRequest(with parameters: [String: Any], to url: URL) {
        AF.request(url, method: .post, parameters: parameters).response {response in
            debugPrint(response)
        }
    }
}

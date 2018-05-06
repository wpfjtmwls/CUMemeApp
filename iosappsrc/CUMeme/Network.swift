//
//  Network.swift
//  CUMeme
//
//  Created by 毛悦 on 5/5/18.
//  Copyright © 2018 Yue mao. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Network {
    
    private static let endpoint = "https://api.giphy.com/v1/gifs/search"
    
    static func getTracks(withQuery query: String, _ completion: @escaping ([String]) -> Void) {
        
        let parameters: Parameters = [
            "api_key" : "T5DYAtaP0K5nw04jnEXEJBe0Lt6fXJ5z",
            "q" : query,
            ]
        
        Alamofire.request(endpoint, parameters: parameters).validate().responseJSON { (response) in
            
            switch response.result {
                
            case .success(let json):
                
                let json = JSON(json)
                print(json)
//                var urls: [URL] = []
                var strings: [String] = []
                
//                let array: [JSON] = json["data"].arrayValue
                
                for gifJSON in json["data"].arrayValue  {
//                    if let url = URL(string: gifJSON["url"].stringValue ){
//                        urls.append(url)
//                        print(url)
//                    }
                    strings.append(gifJSON["url"].stringValue)
                }

                completion(strings)
                
            case .failure(let error):
                print("[Network] Error:", error)
                completion([])
                
            }
            
        }
    }
    
}

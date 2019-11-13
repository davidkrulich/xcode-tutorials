//
//  WeatherApi.swift
//  HelloWorld
//
//  Created by David Krulich on 13/11/2019.
//  Copyright © 2019 David Krulich. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class WeatherApi {
    
    class func getData(stringUrl: String = "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22",
                       completion: @escaping (WeatherModel?) -> Void) {
        guard let url = URL(string: stringUrl) else {
            completion(nil)
            return
        }
        
        AF.request(url)
          .responseObject { (response: DataResponse<WeatherModel, AFError>) in
            let value = response.value
            completion(value)
        }
    }
}

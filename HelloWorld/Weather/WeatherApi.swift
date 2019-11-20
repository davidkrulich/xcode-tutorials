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

enum WeatherUrl {
    case place(String)
    
    var url: URL? {
        switch self {
        case let .place(place):
            return URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=\(place)&appid=b6907d289e10d714a6e88b30761fae22")
        }
    }
}

protocol WeatherApiProtocol {
    func getData(place: WeatherUrl, completion: @escaping (WeatherModel?) -> Void)
}

class WeatherApiAlamofire: WeatherApiProtocol {
    
    func getData(place: WeatherUrl,
                       completion: @escaping (WeatherModel?) -> Void) {
        guard let url = place.url else {
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

class WeatherApiURLSession: WeatherApiProtocol {
    
    var dataTask: URLSessionDataTask?
    
    func getData(place: WeatherUrl,
                 completion: @escaping (WeatherModel?) -> Void) {
        guard let url = place.url else {
            completion(nil)
            return
        }
        
        dataTask?.cancel()
        
        let defaultSession = URLSession(configuration: .default)
        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let _ = error {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    let responseData = WeatherModel(JSON: json)
                    completion(responseData)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        })
        
        dataTask?.resume()
    }
}

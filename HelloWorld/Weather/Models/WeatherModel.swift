//
//  WeatherModel.swift
//  HelloWorld
//
//  Created by David Krulich on 13/11/2019.
//  Copyright © 2019 David Krulich. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherModel: Mappable {
    
    var main: WeatherMainModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        main <- map["main"]
    }
}

class WeatherMainModel: Mappable {
    
    var temperature: Float?
    var temperatureMax: Float?
    var temperatureMin: Float?
    var pressure: Float?
    var humidity: Float?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temperature <- map["temp"]
        temperatureMax <- map["temp_max"]
        temperatureMin <- map["temp_min"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
    }
}

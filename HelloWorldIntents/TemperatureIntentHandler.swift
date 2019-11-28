//
//  TemperatureIntentHandler.swift
//  HelloWorldIntents
//
//  Created by David Krulich on 27/11/2019.
//  Copyright © 2019 David Krulich. All rights reserved.
//

import Foundation
import Intents

class TemperatureIntentHandler: NSObject, TemperatureIntentHandling {
    
    func handle(intent: TemperatureIntent, completion: @escaping (TemperatureIntentResponse) -> Void) {
        completion(.success(temperature: 2.2)) // TODO: Load a correct temp.
    }
}

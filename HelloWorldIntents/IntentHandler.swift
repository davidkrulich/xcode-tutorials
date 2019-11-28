//
//  IntentHandler.swift
//  HelloWorldIntents
//
//  Created by David Krulich on 27/11/2019.
//  Copyright © 2019 David Krulich. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any? {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        guard intent is TemperatureIntent else {
            return .none
        }
        
        return TemperatureIntentHandler()
    }
}

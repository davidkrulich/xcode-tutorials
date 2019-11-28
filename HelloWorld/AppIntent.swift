//
//  AppIntent.swift
//  HelloWorld
//
//  Created by David Krulich on 27/11/2019.
//  Copyright © 2019 David Krulich. All rights reserved.
//

import Foundation
import Intents

class AppIntent {

    class func allowSiri() {
        INPreferences.requestSiriAuthorization { status in
            switch status {
            case .notDetermined,
                 .restricted,
                 .denied:
                print("Siri error.")
            case .authorized:
                print("Siri ok.")
            }
        }
    }
    
    class func temperature() {
        let intent = TemperatureIntent()
        intent.suggestedInvocationPhrase = "Get Temperature"
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { error in
            if let error = error as NSError? {
                print("Interaction donation failed: \(error.description).")
            } else {
                print("Successfully donated interaction.")
            }
        }
    }
}

//
//  SystemSettingsService.swift
//  HelloWorld
//
//  Created by David Krulich on 03/03/2020.
//  Copyright © 2020 David Krulich. All rights reserved.
//

import Foundation

class SystemSettingsService {

    private let userDefaults: UserDefaults

    var isFunctionalityEnabled: Bool {
        guard let value: Bool = getValue(for: "isFunctionalityEnabled") else {
            return false
        }
        
        return value
    }
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    private func getValue<T>(for key: String) -> T? {
        return userDefaults.object(forKey: key) as? T
    }

    private func set<T>(value: T?, for key: String) {
        userDefaults.set(value, forKey: key)
    }
}

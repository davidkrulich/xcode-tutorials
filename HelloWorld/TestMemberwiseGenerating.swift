//
//  TestMemberwiseGenerating.swift
//  HelloWorld
//
//  Created by David Krulich on 07/08/2019.
//  Copyright © 2019 David Krulich. All rights reserved.
//

import Foundation

class TestMemberwiseGenerating {
    
    let bar12: Int
    var foo: String?

    init(foo: String?, bar: Int) {
        self.bar12 = bar
        self.foo = foo
        
        format(with: "test")
    }
    
    /// Some comment.
    ///
    /// ```
    /// Format:
    /// foo bar12 variable
    /// ```
    ///
    /// - Throws: No exceptions.
    ///
    /// - Parameters:
    ///     - variable: First variable.
    ///
    /// - Returns: Formated string.
    func format(with variable: String) -> String {
        guard let foo = foo else {
            return "\(bar12) \(variable)"
        }

        return "\(foo) \(bar12) \(variable)"
    }
}

//
//  WeatherApiTests.swift
//  HelloWorldTests
//
//  Created by David Krulich on 13/11/2019.
//  Copyright © 2019 David Krulich. All rights reserved.
//

import XCTest
@testable import HelloWorld

class WeatherApiTests: XCTestCase {
    
    func testWeatherData() {
        let exp = expectation(description: "testWeatherData")
        
        WeatherApi.getData { data in
            XCTAssertEqual(data?.main?.temperature, 280.32)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 4, handler: nil)
    }
}

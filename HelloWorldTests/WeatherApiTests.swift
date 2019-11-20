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
    
    func testWeatherDataAlamofire() {
        let exp = expectation(description: "testWeatherDataAlamofire")
        
        let api = WeatherApiAlamofire()
        api.getData(place: .place("London,uk")) { data in
            XCTAssertEqual(data?.main?.temperature, 280.32)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 4, handler: nil)
    }
    
    func testWeatherDataURLSession() {
        let exp = expectation(description: "testWeatherDataURLSession")
        
        let api = WeatherApiURLSession()
        api.getData(place: .place("London,uk")) { data in
            XCTAssertEqual(data?.main?.temperature, 280.32)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 4, handler: nil)
    }
}

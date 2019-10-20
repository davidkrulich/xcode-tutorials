//
//  HelloWorldTests.swift
//  HelloWorldTests
//
//  Created by David Krulich on 03/08/2019.
//  Copyright © 2019 David Krulich. All rights reserved.
//

import XCTest
@testable import HelloWorld

class HelloWorldTests: XCTestCase {

    func testVariable() {
        let constant = "Hello"
        XCTAssertEqual(constant, "Hello")
//        constant = "Hello #2"
//        XCTAssertEqual(constant, "Hello #2")
//        constant += " #3"
//        XCTAssertEqual(constant, "Hello #2 #3")
    }

    func testOptionals() {
        let obj: TestMemberwiseGenerating? = TestMemberwiseGenerating(foo: "Hello", bar: 56)
//        XCTAssertEqual(obj?.foo, "Hello")
//        XCTAssertEqual(obj!.foo, "Hello")
//        XCTAssertEqual(obj?.foo!, "Hello")
//        XCTAssertEqual(obj!.foo!, "Hello")
        
        guard let foo = obj?.foo else {
            XCTFail()
            return
        }
        
        // foo is not optional here.
        XCTAssertEqual(foo, "Hello")
        
        for i in 0..<10 {
            guard i % 2 == 1 else {
                print("Skipped \(i)")
                continue
            }
            print("Apply \(i)")
        }
    }

    func testParseInt() {
        XCTAssertEqual("321".parseInt(), 321)
        XCTAssertEqual("Hello".parseInt(), nil)
    }
    
    func testDifficulty() {
        let difficulty = Difficulty.custom(name: "custom difficulty")
        
        switch difficulty {
        case .normal:
            break
        case .hard:
            break
        case let .custom(name):
            XCTAssertEqual(name, "custom difficulty")
        }
    }
}

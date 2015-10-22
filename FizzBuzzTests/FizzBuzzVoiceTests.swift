//
//  FizzBuzzVoiceTests.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 22/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class FizzBuzzVoiceTests: XCTestCase {
    
    var fizzbuzzVoice: FizzBuzzVoice!
    
    override func setUp() {
        super.setUp()
        fizzbuzzVoice = FizzBuzzVoice()
    }
    
    override func tearDown() {
        fizzbuzzVoice = nil
        super.tearDown()
    }
    
    func testVoiceHasABrain() {
        let result = fizzbuzzVoice.brain
        XCTAssertNotNil(result)
    }
    
    func testSaysFizzForThree() {
        let result = fizzbuzzVoice.check(3)
        XCTAssertEqual(result, "fizz")
    }
    
    func testSaysBuzzForFive() {
        let result = fizzbuzzVoice.check(5)
        XCTAssertEqual(result, "buzz")
    }
    
    func testSaysFizzBuzzForFifteen() {
        let result = fizzbuzzVoice.check(15)
        XCTAssertEqual(result, "fizzbuzz")
    }
    
    func testSaysNumberForOne() {
        let result = fizzbuzzVoice.check(1)
        XCTAssertEqual(result, "1")
    }
    
}

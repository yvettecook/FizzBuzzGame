//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by Yvette Cook on 22/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class FizzBuzzTests: XCTestCase {
    
    var fizzbuzz: FizzBuzz!
    
    override func setUp() {
        super.setUp()
        fizzbuzz = FizzBuzz()
    }
    
    func testIsDivisibleByThree() {
        let result = fizzbuzz.isDivisibleByThree(3)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByThree() {
        let result = fizzbuzz.isDivisibleByThree(1)
        XCTAssertEqual(result, false)
    }
    
    func testIsDivisibleByFive() {
        let result = fizzbuzz.isDivisibleByFive(5)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByFive() {
        let result = fizzbuzz.isDivisibleByFive(1)
        XCTAssertEqual(result, false)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}

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
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsDivisibleByThree() {
        XCTAssertEqual(self.fizzbuzz.isDivisibleByThreee(3), true)
    }
    
    
}

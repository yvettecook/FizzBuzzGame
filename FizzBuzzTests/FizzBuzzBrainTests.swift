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
    
    var fizzbuzz: FizzBuzzBrain!
    
    override func setUp() {
        super.setUp()
        fizzbuzz = FizzBuzzBrain()
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
    
    func testIsDivisibleByFifteen() {
        let result = fizzbuzz.isDivisibleByFifteen(15)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByFifteen() {
        let result = fizzbuzz.isDivisibleByFifteen(1)
        XCTAssertEqual(result, false)
    }
    
    func testSaysFizzForThree() {
        let result = fizzbuzz.check(3)
        XCTAssertEqual(result, Moves.Fizz)
    }
    
    func testSaysBuzzForFive() {
        let result = fizzbuzz.check(5)
        XCTAssertEqual(result, Moves.Buzz)
    }
    
    func testSaysFizzBuzzForFifteen() {
        let result = fizzbuzz.check(15)
        XCTAssertEqual(result, Moves.FizzBuzz)
    }
    
    func testSaysNumberForOne() {
        let result = fizzbuzz.check(1)
        XCTAssertEqual(result, Moves.Number)
    }
    
    override func tearDown() {
        fizzbuzz = nil
        super.tearDown()
    }
    
}

//
//  FizzBuzzGame.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 22/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class FizzBuzzGameTests: XCTestCase {
    
    var fizzbuzzGame : FizzBuzzGame!

    override func setUp() {
        super.setUp()
        fizzbuzzGame = FizzBuzzGame()
    }
    
    override func tearDown() {
        fizzbuzzGame = nil
        super.tearDown()
    }
    
    func testHasAScoreCount() {
        XCTAssertNotNil(fizzbuzzGame.score)
    }
    
    func testHasABrain() {
        XCTAssertNotNil(fizzbuzzGame.brain)
    }
        
    func testGameStartsAtZero() {
        XCTAssertTrue(fizzbuzzGame.score == 0)
    }
    
    func testOnPlayScoreIsIncremented() {
        fizzbuzzGame.play(.Number)
        XCTAssertTrue(fizzbuzzGame.score == 1)
    }
    
    func testOnPlayAMoveIsEntered() {
        let result = fizzbuzzGame.play(.Number)
        XCTAssertTrue(result)
    }
    
    func testCanCheckIfMoveIsRight() {
        let result = fizzbuzzGame.play(.Number)
        XCTAssertTrue(result)
    }
    
    func testCanCheckIfMoveIsWrong() {
        let result = fizzbuzzGame.play(.Fizz)
        XCTAssertFalse(result)
    }
    
    func testCanCheckForFizzBuzz() {
        fizzbuzzGame.score = 14
        let result = fizzbuzzGame.play(.FizzBuzz)
        XCTAssertTrue(result)
    }

}

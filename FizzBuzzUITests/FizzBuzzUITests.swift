//
//  FizzBuzzUITests.swift
//  FizzBuzzUITests
//
//  Created by Yvette Cook on 22/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import XCTest

class FizzBuzzUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTapOnScoreButtonShouldIncrementScoreByOne() {
        let app = XCUIApplication()
        let button = app.buttons["scoreButton"]
        button.tap()
        let scoreTitle = button.title
        XCTAssertEqual(scoreTitle, "1")
    }
    
    func test() {
        XCUIApplication().buttons["scoreButton"].tap()
        
    }
    
}

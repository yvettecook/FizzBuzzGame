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
        app.buttons["0"].tap()
        let scoreTitle = app.buttons["0"].title
        XCTAssertEqual(scoreTitle, "1")
    }
    
}

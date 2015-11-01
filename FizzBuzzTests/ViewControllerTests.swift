//
//  ViewControllerTests.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 25/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class ViewControllerTests: XCTestCase {
    
    var viewController : ViewController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        viewController = storyboard.instantiateViewControllerWithIdentifier("FizzBuzzViewController") as! ViewController
        UIApplication.sharedApplication().keyWindow!.rootViewController = viewController
        
        let _ = viewController

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldHaveScoreDisplayButton() {
        XCTAssertNotNil(viewController.scoreButton)
    }
    
    func testShouldHaveFizzButton() {
        XCTAssertNotNil(viewController.fizzButton)
    }
    
    func testShouldHaveBuzzButton() {
        XCTAssertNotNil(viewController.buzzButton)
    }
    
    func testCanSetScoreDisplay() {
        XCTAssertTrue(false)
//        viewController.setScoreTo("1")
//        let score = viewController.scoreButton.titleLabel?.text
//        XCTAssertEqual(score, "1")
    }
    
    
    // MARK : Connection to View Model
    
    func testShouldHaveViewModel() {
        XCTAssertNotNil(viewController.viewModel)
    }
    
//    func testCanCheckIfMoveCorrect() {
//        let result = viewController.checkMove(.Number)
//        XCTAssertEqual(result, "1")
//    }
//    
//    func testCanCheckIfMoveIncorrect() {
//        let result = viewController.checkMove(.Fizz)
//        XCTAssertNil(result)
//    }
    
    func testIfMoveCorrectScoreIncremented() {
        viewController.checkMove(.Number)
        let newScore = viewController.scoreButton.titleLabel?.text
        XCTAssertEqual(newScore, "1")
    }
    

}

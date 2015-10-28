//
//  ViewModelTests.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 28/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class ViewModelTests: XCTestCase {

    let vm = ViewModel()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShouldHaveFizzBuzzGame() {
        XCTAssertNotNil(vm.game)
    }

}

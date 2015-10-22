//
//  FizzBuzz.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 22/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import Foundation

class FizzBuzz : NSObject {
    
    func isDivisibleByThree(number: Int) -> Bool {
        return isDivisibleBy(number, divisor: 3)
    }
    
    func isDivisibleByFive(number: Int) -> Bool {
        return isDivisibleBy(number, divisor: 5)
    }
    
    func isDivisibleByFifteen(number: Int) -> Bool {
        return isDivisibleBy(number, divisor: 15)
    }
    
    func isDivisibleBy(number: Int, divisor: Int) -> Bool {
        if number % divisor == 0 {
            return true
        } else {
            return false
        }
    }
    
}
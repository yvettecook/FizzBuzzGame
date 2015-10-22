//
//  FizzBuzzVoice.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 22/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import Foundation

class FizzBuzzVoice {
    
    let brain = FizzBuzzBrain()
    
    func check(number: Int) -> String {
        if brain.isDivisibleByFifteen(number) { return "fizzbuzz"  }
        if brain.isDivisibleByThree(number)   { return "fizz"      }
        if brain.isDivisibleByFive(number)    { return "buzz"      }
        else                                  { return "\(number)" }
    }
    
}

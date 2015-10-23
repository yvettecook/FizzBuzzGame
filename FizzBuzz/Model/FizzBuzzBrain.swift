//
//  FizzBuzzBrain.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 22/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

class FizzBuzzBrain {
    
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
        return number % divisor == 0
    }
    
    func check(number: Int) -> Moves {
        if isDivisibleByFifteen(number) { return .FizzBuzz  }
        if isDivisibleByThree(number)   { return .Fizz      }
        if isDivisibleByFive(number)    { return .Buzz      }
        else                            { return .Number    }
    }
    
}
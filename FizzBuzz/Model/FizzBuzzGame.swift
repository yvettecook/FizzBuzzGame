//
//  FizzBuzzGame.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 22/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

class FizzBuzzGame {
    
    var score : Int!
    let brain : FizzBuzzBrain!
    
    init(){
        score = 0
        brain = FizzBuzzBrain()
    }
    
    func play(move: Moves) -> Bool {
        score = score + 1
        if move == brain.check(score) { return true }
        else { return false }
        
    }
    
}

enum Moves {
    case Number, Fizz, Buzz, FizzBuzz
}
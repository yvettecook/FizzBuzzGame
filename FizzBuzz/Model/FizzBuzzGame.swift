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
    
    func play(move: Moves) -> MoveReponse {
        let newScore = score + 1
        if move == brain.check(newScore) {
            score = newScore
            return MoveReponse(rightMove: true, score: score)
        } else {
            return MoveReponse(rightMove: false, score: score)
        }
    }
    
    func reset() -> Int {
        score = 0
        return score
    }
    
}

enum Moves {
    case Number, Fizz, Buzz, FizzBuzz
}

struct MoveReponse {
    let rightMove: Bool
    let score: Int
}


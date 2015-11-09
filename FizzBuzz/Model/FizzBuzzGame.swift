//
//  FizzBuzzGame.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 22/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import Foundation

class FizzBuzzGame: NSObject {
    
    static let sharedInstance = FizzBuzzGame()
    
    var score : Int!
    let brain : FizzBuzzBrain!
    let memory : GameMemory!
    
    private override init(){
        score = 0
        brain = FizzBuzzBrain()
        memory = GameMemory()
        super.init()
    }
    
    func play(move: Moves) -> MoveReponse {
        let newScore = score + 1
        if move == brain.check(newScore) {
            score = newScore
            return MoveReponse(rightMove: true, score: score)
        } else {
            memory.storeScore(score)
            return MoveReponse(rightMove: false, score: score)
        }
    }
    
    func reset() -> Int {
        score = 0
        return score
    }
    
    func getHighScore() -> Int {
        return memory.getHighScore()
    }
    
    func saveScores() {
        memory.saveScores()
    }
    
}

enum Moves {
    case Number, Fizz, Buzz, FizzBuzz
}

struct MoveReponse {
    let rightMove: Bool
    let score: Int
}






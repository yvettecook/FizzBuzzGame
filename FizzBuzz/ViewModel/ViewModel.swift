//
//  ViewModel.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 28/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

class ViewModel {
    
    let game = FizzBuzzGame()
    var vc : ViewController!
    
    func checkMove(move: Moves) {
        let response = game.play(move)
        if response.rightMove {
            vc.nextMovePrompt("\(response.score)")
        } else {
            vc.gameLost()
        }
    }
    
    func resetGame() {
        let resetScore = game.reset()
        vc.nextMovePrompt("\(resetScore)")
        vc.resetGame()
    }
        
}


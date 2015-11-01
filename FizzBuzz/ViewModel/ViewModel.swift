//
//  ViewModel.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 28/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

class ViewModel {
    
    let game = FizzBuzzGame()
    
    func checkMove(move: Moves) -> String? {
        let response = game.play(move)
        if response.rightMove {
            return "\(response.score)"
        } else {
            return nil
        }
    }
        
}


//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 22/10/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var fizzButton: UIButton!
    @IBOutlet weak var buzzButton: UIButton!
    @IBOutlet weak var fizzBuzzButton: UIButton!
    
    let viewModel = ViewModel()
    var state = UIState.Playing {
        didSet {
            toggleState()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vc = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Input Actions
    
    @IBAction func tapped(sender: UIButton) {
        switch sender {
        case scoreButton:
            checkMove(.Number)
        case fizzButton:
            checkMove(.Fizz)
        case buzzButton:
            checkMove(.Buzz)
        case fizzBuzzButton:
            checkMove(.FizzBuzz)
        default:
            break
        }
    }
    
    func checkMove(move: Moves) {
       viewModel.checkMove(move)
    }
    
    @IBAction func playAgain(sender: UIButton) {
        viewModel.resetGame()
    }
    
    
    // MARK: Output Actions
    
    func nextMovePrompt(score: String) {
        scoreButton.setTitle(score, forState: .Normal)
    }
    
    func gameLost() {
        self.state = .Lost
    }
    
    func setBackgroundColorTo(color: UIColor) {
        self.view.backgroundColor = color
    }
    
    // MARK: State
    
    func toggleState() {
        switch state {
        case .Playing:
            setBackgroundColorTo(FizzBuzzColors.activeBackgroundColor)
        case .Lost:
            setBackgroundColorTo(FizzBuzzColors.lostBackgroundColor)
        }
    }
    
    func resetGame() {
        state = .Playing
    }

}


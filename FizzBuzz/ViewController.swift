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
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var hsLabel: UILabel!
    @IBOutlet weak var multiplesButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var gradient : CAGradientLayer?
    
    let viewModel = ViewModel()
    var state = UIState.Playing {
        didSet {
            toggleState()
        }
    }
    
    var playButtons: [UIButton]!
    var settingsViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vc = self
        playButtons = [scoreButton, fizzButton, buzzButton, fizzBuzzButton]
        settingsViews = [highScoreLabel, hsLabel, multiplesButton, settingsButton, playButton]
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
            enablePlayButtons()
            hideSettingsButtons()
        case .Lost:
            setBackgroundColorTo(FizzBuzzColors.lostBackgroundColor)
            disablePlayButtons()
            showSettingsButtons()
        }
    }
    
    func resetGame() {
        state = .Playing
    }
    
    func disablePlayButtons() {
        for button in playButtons {
            button.userInteractionEnabled = false
        }
    }
    
    func enablePlayButtons() {
        for button in playButtons {
            button.userInteractionEnabled = true
        }
    }
    
    func hideSettingsButtons() {
        for view in settingsViews {
            view.hidden = true
        }
    }

    func showSettingsButtons() {
        for view in settingsViews {
            view.hidden = false
        }
    }

}

extension ViewController {
    
    // MARK: Background animation
    
    func setUpTestGradient() {
        gradient = CAGradientLayer()
        gradient?.frame = view.bounds
        gradient?.colors = [UIColor.yellowColor().CGColor]
        view.layer.insertSublayer(gradient!, atIndex:0)
    
        animateLayer()

    }
    
    func animateLayer() {
        let fromColors = [UIColor.redColor().CGColor, UIColor.redColor().CGColor]
        let toColors = [UIColor.blueColor().CGColor, UIColor.blueColor().CGColor]
        
        gradient?.colors = toColors
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = 10.0
        animation.removedOnCompletion = true
        animation.fillMode = kCAFillModeBoth
        animation.delegate = self
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        gradient?.addAnimation(animation, forKey: "animateGradient")
    }
    
}


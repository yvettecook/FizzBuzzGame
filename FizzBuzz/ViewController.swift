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
    
    @IBOutlet weak var background: UIView!
    
    var gameTime = 30.0
    
    var fluidView: BAFluidView!
    var gameTimer: NSTimer?
    
    let viewModel = ViewModel()
    var state = UIState.Ready {
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
        if state != .Playing {
            state = .Playing
        }
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
        guard let timer = gameTimer else { return }
        timer.invalidate()
    }
    
    func setBackgroundColorTo(color: UIColor) {
        self.background.backgroundColor = color
    }
    
    // MARK: State
    
    func toggleState() {
        switch state {
        case .Ready:
            setBackgroundColorTo(FizzBuzzColors.lostBackgroundColor)
            enablePlayButtons()
            showSettingsButtons()
        case .Playing:
            setUpFluidLayer()
            startTimer()
            setBackgroundColorTo(FizzBuzzColors.activeBackgroundColor)
            enablePlayButtons()
            hideSettingsButtons()
        case .Lost:
            setBackgroundColorTo(FizzBuzzColors.lostBackgroundColor)
            disablePlayButtons()
            showSettingsButtons()
            removeFluidView()
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
    
    func startTimer() {
        gameTimer = NSTimer(timeInterval: gameTime, target: self, selector:"timerFinished", userInfo: nil, repeats: false)
        NSRunLoop.currentRunLoop().addTimer(gameTimer!, forMode: NSRunLoopCommonModes)
    }
    
    func timerFinished() {
        viewModel.timerRunOut()
    }
    
    func stopTimer() {
        gameTimer?.invalidate()
    }

}

extension ViewController {
    
    // MARK: FLuidAnimation
    
    func setUpFluidLayer() {
        fluidView = BAFluidView(frame: self.background.frame, startElevation: 0.0)
        fluidView.fillDuration = gameTime
        fluidView.fillTo(1.0)
        fluidView.fillColor = FizzBuzzColors.timerBackgroundColor
        fluidView.fillRepeatCount = 1
        fluidView.fillAutoReverse = false
        self.background.addSubview(fluidView)
    }
    
    func pauseFluidView() {
        fluidView.keepStationary()
        fluidView.stopAnimation()
    }

    func playFluidView() {
        fluidView.startAnimation()
    }
    
    func removeFluidView() {
        fluidView.removeFromSuperview()
        fluidView = nil
    }
    
}


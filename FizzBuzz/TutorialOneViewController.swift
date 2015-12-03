//
//  TutorialOneViewController.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 28/11/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import Foundation

class TutorialOneViewController: UIViewController {
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var fizzButton: UIButton!
    @IBOutlet weak var buzzButton: UIButton!
    @IBOutlet weak var fizzBuzzButton: UIButton!
    
    var step1: TutorialStep?
    var step2: TutorialStep?
    var step3: TutorialStep?
    var step4: TutorialStep?
    
    var steps: [TutorialStep]?
    
    let finalStep = 15
    
    var fizzBuzzStep = 0 {
        didSet {
            numberButton.setTitle("\(fizzBuzzStep)", forState: .Normal)
            guard let currentStep = tutorialStep, let steps = steps else { return }
            if fizzBuzzStep == finalStep {
                completedTutorial()
            } else if fizzBuzzStep == currentStep.triggerStep {
                tutorialStep = steps[currentStep.stepNumber + 1]
            }
        }
    }
    
    var tutorialStep: TutorialStep? {
        didSet {
            guard let step = tutorialStep else { return }
            for button in step.visibleButtons {
                button.hidden = false
            }
            for button in step.hiddenButtons {
                button.hidden = true
            }
            instructionLabel.text = step.instructions
        }
    }
    
    @IBAction func numberButtonTapped(sender: UIButton) {
        guard let numberSteps = tutorialStep?.numberSteps else { return }
        if numberSteps.contains(fizzBuzzStep) {
            fizzBuzzStep++
        }
    }
    
    @IBAction func fizzButtonTapped(sender: UIButton) {
        guard let fizzSteps = tutorialStep?.fizzSteps else { return }
        if fizzSteps.contains(fizzBuzzStep) {
            fizzBuzzStep++
        }
    }
    
    @IBAction func buzzButtonTapped(sender: UIButton) {
        guard let buzzSteps = tutorialStep?.buzzSteps else { return }
        if buzzSteps.contains(fizzBuzzStep) {
            fizzBuzzStep++
        }    }
    
    @IBAction func ButtonTapped(sender: UIButton) {
        guard let fizzBuzzSteps = tutorialStep?.fizzBuzzSteps else { return }
        if fizzBuzzSteps.contains(fizzBuzzStep) {
            fizzBuzzStep++
        }
    }
    
    
    override func viewDidLoad() {
        setUpSteps()
        tutorialStep = step1
    }
    
    func completedTutorial() {
        let alert = UIAlertController(title: "Well Done", message: "Let's go play.", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "Play", style: .Default) { (action) in
            self.performSegueWithIdentifier("unwindToHome", sender: self)
        }
        alert.addAction(OKAction)
        
        self.presentViewController(alert, animated: true) {
        }
    }

    func setUpSteps() {
        step1 = TutorialStep(
            stepNumber: 0,
            numberSteps: [0,1],
            fizzSteps: nil,
            buzzSteps: nil,
            fizzBuzzSteps: nil,
            instructions:  "Your aim is to count up as high as you can without making a mistake.",
            visibleButtons: [numberButton],
            hiddenButtons: [fizzButton, buzzButton, fizzBuzzButton],
            triggerStep: 2
        )
        
        step2 = TutorialStep(
            stepNumber: 1,
            numberSteps: [3],
            fizzSteps: [2],
            buzzSteps: nil,
            fizzBuzzSteps: nil,
            instructions:  "If the next number is a multiple of 3, tap the Fizz button",
            visibleButtons: [numberButton, fizzButton],
            hiddenButtons: [buzzButton, fizzBuzzButton],
            triggerStep: 4
        )
        
        step3 = TutorialStep(
            stepNumber: 2,
            numberSteps: [6,7],
            fizzSteps: [5,8],
            buzzSteps: [4,9],
            fizzBuzzSteps: nil,
            instructions:  "If the next number is a multiple of 5, tap the Buzz button",
            visibleButtons: [numberButton, fizzButton, buzzButton],
            hiddenButtons: [fizzBuzzButton],
            triggerStep: 10
        )
        
        step4 = TutorialStep(
            stepNumber: 3,
            numberSteps: [10,12,13],
            fizzSteps: [11],
            buzzSteps: [],
            fizzBuzzSteps: [14],
            instructions:  "Finally, if the next number is a multiple of 3 AND 5, tap the FizzBuzz button",
            visibleButtons: [numberButton, fizzButton, buzzButton, fizzBuzzButton],
            hiddenButtons: [],
            triggerStep: 15
        )
        
        steps = [step1!, step2!, step3!, step4!]
    }
    
}

struct TutorialStep {
    let stepNumber: Int

    let numberSteps: [Int]
    let fizzSteps: [Int]?
    let buzzSteps: [Int]?
    let fizzBuzzSteps: [Int]?
    
    let instructions: String
    
    let visibleButtons: [UIButton]
    let hiddenButtons: [UIButton]
    
    let triggerStep: Int
}

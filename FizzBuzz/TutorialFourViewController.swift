//
//  TutorialFourViewController.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 29/11/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import UIKit

class TutorialFourViewController: UIViewController {
    
    let numberSteps = [10,12,13]
    let fizzSteps = [11]
    let fizzBuzzSteps = [14]
    
    var tutorialStep : Int = 0 {
        didSet {
            numberButton.setTitle("\(tutorialStep)", forState: .Normal)
            if tutorialStep == 15 {
                print("WELL DONE")
            }
        }
    }
    
    @IBOutlet weak var numberButton: UIButton!
    
    override func viewDidLoad() {
        tutorialStep = 10
    }
    
    @IBAction func fizzButtonTapped(sender: UIButton) {
        if fizzSteps.contains(tutorialStep) {
            tutorialStep++
        }
    }
    
    @IBAction func numberButtonTapped(sender: UIButton) {
        if numberSteps.contains(tutorialStep) {
            tutorialStep++
        }
    }

    @IBAction func fizzBuzzButtonTapped(sender: UIButton) {
        if fizzBuzzSteps.contains(tutorialStep) {
            tutorialStep++
        }
    }
    
}
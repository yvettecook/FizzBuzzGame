//
//  TutorialThreeViewController.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 29/11/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import UIKit

class TutorialThreeViewController: UIViewController {
    
    let numberSteps = [6,7]
    let fizzSteps = [5,8]
    let buzzSteps = [4,9]
    
    var tutorialStep : Int = 0 {
        didSet {
            numberButton.setTitle("\(tutorialStep)", forState: .Normal)
            if tutorialStep == 10 {
                performSegueWithIdentifier("showStep4", sender: self)
            }
        }
    }
    
    @IBOutlet weak var numberButton: UIButton!
    
    override func viewDidLoad() {
        tutorialStep = 4
    }
    
    @IBAction func fizzButtonTapped(sender: UIButton) {
        if fizzSteps.contains(tutorialStep) {
            tutorialStep++
        }
    }
    
    @IBAction func buzzButtonTapped(sender: UIButton) {
        if buzzSteps.contains(tutorialStep) {
            tutorialStep++
        }
    }
    
    @IBAction func numberButtonTapped(sender: UIButton) {
        if numberSteps.contains(tutorialStep) {
            tutorialStep++
        }
    }
    
}

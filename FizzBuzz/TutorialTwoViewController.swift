//
//  Tutorial2ViewController.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 28/11/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import UIKit

class TutorialTwoViewController: UIViewController {
    
    var tutorialStep : Int = 2 {
        didSet {
            numberButton.setTitle("\(tutorialStep)", forState: .Normal)
            if tutorialStep == 4 {
                performSegueWithIdentifier("showStep3", sender: self)
            }
        }
    }
    
    @IBOutlet weak var numberButton: UIButton!
    
    override func viewDidLoad() {
        tutorialStep = 2
    }
    
    @IBAction func fizzButtonTapped(sender: UIButton) {
        if tutorialStep == 2 {
            tutorialStep++
        }
    }
    
    @IBAction func numberButtonTapped(sender: UIButton) {
        if tutorialStep == 3 {
            tutorialStep++
        }
    }
    
}



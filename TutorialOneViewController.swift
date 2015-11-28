//
//  TutorialOneViewController.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 28/11/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import Foundation

class TutorialOneViewController: UIViewController {
    
    var tutorialStep = 0 {
        didSet {
            if tutorialStep == 2 { performSegueWithIdentifier("showStep2", sender: self) }
            numberButton.setTitle("\(tutorialStep)", forState: .Normal)
        }
    }
    
    @IBOutlet weak var numberButton: UIButton!
    
    @IBAction func numberButtonTapped(sender: UIButton) {
        tutorialStep++
    }
    
}
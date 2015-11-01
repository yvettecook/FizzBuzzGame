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
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        default:
            break
        }
    }
    
    func checkMove(move: Moves) {
        guard
            let checkedResult = viewModel.checkMove(move)
            else { print("YOU LOST THE GAME"); return }
        scoreButton.setTitle(checkedResult, forState: .Normal)
    }
    
    // MARK: Output Actions
    
    func setScoreTo(string: String) {
        scoreButton.setTitle(string, forState: .Normal)
    }

}


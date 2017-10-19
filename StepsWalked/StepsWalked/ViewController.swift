//
//  ViewController.swift
//  StepsWalked
//
//  Created by sunil on 9/14/17.
//  Copyright © 2017 sunlee. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var stepsCounterLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    let pedometer : CMPedometer = CMPedometer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        switchToReadyState()
        
    }

    @IBAction func startButtonTapped(_ sender: Any) {
        // capturing motion
        self.switchToResetState()
        pedometer.startUpdates(from: NSDate() as Date, withHandler: {
            data, error in
            DispatchQueue.main.async() {
                // inside motion capture
                // Updating numberOfSteps
                self.stepsCounterLabel.text = "Steps: " + String(stringInterpolationSegment: data!.numberOfSteps)
            }
        })
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        pedometer.stopUpdates()
        stepsCounterLabel.text = "Steps: 0"
        switchToReadyState()
    }
    
    func switchToResetState() {
        // TODO: combine reset and ready states into a single function
        resetButton.isEnabled = true
        startButton.isEnabled = false
        resetButton.alpha = 1.0
        startButton.alpha = 0.5
    }
    
    func switchToReadyState() {
        resetButton.isEnabled = false
        startButton.isEnabled = true
        resetButton.alpha = 0.5
        startButton.alpha = 1.0
    }
}


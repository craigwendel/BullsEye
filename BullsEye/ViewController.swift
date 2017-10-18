//
//  ViewController.swift
//  BullsEye
//
//  Created by Craig Wendel on 10/16/17.
//  Copyright © 2017 Craig Wendel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" + "\n The target value is \(targetValue)"
        
        let alert = UIAlertController (
            title: "Your Guess",
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction (
            title: "OK",
            style: .default,
            handler: nil
        )

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels () {
        targetLabel.text = String(targetValue)
    }

}


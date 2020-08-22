//
//  ViewController.swift
//  SAP clicker
//
//  Created by Joel Lim Xuan Wei on 11/4/20.
//  Copyright © 2020 Joel Lim Xuan Wei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    var counter = 0
    var timer : Timer?
    var timeElapsed = 0.0
    @IBOutlet weak var timerLabel: UILabel!
    @objc func updateCounter( ) {
        timeElapsed += 0.1
        timerLabel.text = " \(timeElapsed) secs"
    }
    @IBOutlet weak var congrats: UILabel!
    @IBAction func btnPress(_ sender: Any) {
        counter += 1
        label.text = ("\(counter) bottles of nuttela eaten")
    if counter >= 20 {
        congrats.isHidden = false
    }
        if counter == 30 {
            button.isEnabled = false
            button.setTitle("finished", for: .disabled)
            congrats.text = "congrats!"
        }
        self.button.transform = .identity
        UIView.animate(withDuration: 0.05) {
            self.button.transform = self.button.transform.scaledBy(x: 1.05, y: 1.05)
        }
    }

    @IBAction func reset(_ sender: Any) {
        timeElapsed = 0
        counter = 0
        label.text = ("\(counter) bottles of nuttela eaten")
        button.isEnabled = true
        congrats.isHidden = true
        congrats.text = "jiayou!"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        button.isEnabled = true
        congrats.isHidden = true
        button.layer.cornerRadius = 20
        label.layer.borderWidth = 5
        label.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }


}


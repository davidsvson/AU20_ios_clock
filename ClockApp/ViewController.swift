//
//  ViewController.swift
//  ClockApp
//
//  Created by David Svensson on 2020-12-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!

    var timer : Timer?
    var lastTime : Date?
    var running = false
    var timeRemaining = 60.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setTimeLabel()
    }
    
    @IBAction func startStop(_ sender: Any) {
        running = !running
    
        if running {
            lastTime = Date()
            
            updateTime()
            timer = Timer.scheduledTimer(withTimeInterval: 0.05 , repeats: true, block: updateTime(timer:) )
        } else {
            updateTime()
            timer?.invalidate()
        }
    }
    
    func updateTime(timer: Timer? = nil) {
        let now = Date()
        
        if let lastTime = lastTime {
            let diff = now.timeIntervalSince(lastTime)
            
            timeRemaining -= diff
            
            setTimeLabel()
        }
        lastTime = now
    }
    
    func setTimeLabel() {
        timeLabel.text = String(format: "%.1f", timeRemaining)
    }
    
    deinit {
        timer?.invalidate()
    }
}


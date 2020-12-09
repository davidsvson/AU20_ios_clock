//
//  ViewController.swift
//  ClockApp
//
//  Created by David Svensson on 2020-12-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!

    let formatter = DateFormatter()
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        formatter.timeStyle = .medium
        
        updateTimeLabel()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5 , repeats: true, block: updateTimeLabel(timer:) )
    }
    
    func updateTimeLabel(timer: Timer? = nil) {
        let date = Date()
        let timeString = formatter.string(from: date)
        timeLabel.text = timeString
    }
    
    deinit {
       
//        if let timer = timer {
//            timer.invalidate()
//        }
        
        timer?.invalidate()
    }
    


}


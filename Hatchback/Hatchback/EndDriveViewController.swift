//
//  EndDriveViewController.swift
//  Hatchback
//
//  Created by Alex Santarelli on 7/25/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import UIKit

class EndDriveViewController: UIViewController {
    
    @IBOutlet weak var driveTime: UILabel!
    @IBOutlet weak var debugLabel: UILabel!
    
    //global variables 
    let defaults = DriveDefaults()
    let df = DateFormatter()

    var totalTime:TimeInterval = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.setNotInDrive()
        self.displayDistractedTime()
        self.displayTime()
        self.calculateDrivingPercentage()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //View setup before it's pushed
        self.navigationItem.setHidesBackButton(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("Using a fair amount of memory...")
    }
    
    //IBActions
    @IBAction func doneButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    //Getting the amount of time driver drove distracted
    func displayDistractedTime() {
        let amtDistrTime = defaults.getTimeDistracted()
        
        if (amtDistrTime == 0.0) {
            self.debugLabel.text = "Distracted Time: 0:00"
            return
        }
        
        var min = floor(amtDistrTime / 60)
        var sec = floor(amtDistrTime - min * 60)
        
        var minString = ""
        var secString = ""
        
        //minutes distracted
        min = floor(min)
        let minInt:Int = Int(min)
        if min <= 9 {
            minString = "0\(minInt)"
        } else {
            minString = "\(minInt)"
        }
        
        //seconds calculated 
        sec = floor(sec)
        let secInt:Int = Int(sec)
        if sec <= 9 {
            secString = "0\(secInt)"
        } else {
            secString = "\(secInt)"
        }
        
        //setting the debug info label for the amount of distracted time.
        self.debugLabel.text = "Distracted Time: \(minString):\(secString)"
        
    }
    
    func calculateDrivingPercentage() {
        let distrTime = defaults.getTimeDistracted()
        
        if (distrTime == 0.0) {
            self.debugLabel.text = self.debugLabel.text! + "                   Driving Percentage: 100%"
        } else {
            let percentage = floor(100 - (100 * (distrTime / self.totalTime)))
            
            self.debugLabel.text = self.debugLabel.text! + "                        Driving Percentage: \(percentage)%"
        }

        
    }
    
    //Calculations to do with time,
    func displayTime() {
        self.df.dateFormat = "yyyy/MM/dd HH:mm"
        
        let startDriveDate = defaults.getDriveStartTime()
        let endDriveDate = defaults.getDriveEndTime()
        
        let timePastDriveStart = endDriveDate.timeIntervalSince(startDriveDate)
        //convert time passed into hours and minutes that we can display on the label 
        
        self.totalTime = timePastDriveStart
        
        //example
        
        var minutes = floor(timePastDriveStart / 60)
        var seconds = round(timePastDriveStart - minutes * 60)
        
        var minutesString = ""
        var secondsString = ""
        
        //minutes calculated
        minutes = floor(minutes)
        let minInt:Int = Int(minutes)
        if minutes <= 9 {
            
            minutesString = "0\(minInt)"
        } else {
            
            minutesString = "\(minInt)"
        }
        
        //seconds calculated
        seconds = floor(seconds)
        let secInt:Int = Int(seconds)
        if seconds <= 9 {
            
            secondsString = "0\(secInt)"
        } else {
            secondsString = "\(secInt)"
        }
    
        //setting the label after all of the formatting
        self.driveTime.text = "\(minutesString):\(secondsString)"
    }

}

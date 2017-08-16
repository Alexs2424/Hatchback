//
//  EndDriveViewController.swift
//  Hatchback
//
//  Created by Alex Santarelli on 7/25/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import UIKit
import Parse

class EndDriveViewController: UIViewController {
    
    @IBOutlet weak var driveTime: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    //global variables 
    let hb = HB()
    let defaults = DriveDefaults()
    let df = DateFormatter()
    let rewards = KiipRewardManager()

    var totalTime:TimeInterval = 0.0
    var percentage:Int = 0
    var dateStart:Date = Date()
    var distractedTime:TimeInterval = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.setNotInDrive()
        self.dateStart = defaults.getDriveStartTime()
        self.distractedTime = defaults.getTimeDistracted()
        self.displayDistractedTime()
        self.displayTime()
        self.calculateDrivingPercentage()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //View setup before it's pushed
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        //check the current percentage and then show the image based upon what percentage it's at.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("Using a fair amount of memory...")
    }
    
    //IBActions
    @IBAction func doneButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        defaults.clearAll()
        
        defaults.setPrevDriveTime(time: self.totalTime)
        defaults.setPrevDrivePercentage(percentage: self.percentage)
        
        //setting the correct format for the date 
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-mm-yyyy"
//        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
        
//        let newFormatStartDate = dateFormatter.date
        
        self.createTrip(tripTime: self.totalTime,
                        dateStart: self.dateStart,
                        distractedTime: self.distractedTime,
                        drivePercentage: self.percentage,
                        email: "asantarelli@andculture.com")
    }
    
    @IBAction func redeemButton(_ sender: Any) {
        rewards.presentKiipReward() //check the percentage to make sure that it'll work out in the end 
        //also after they redeem the reward chenge the color and make it gray, and un-interactable to show it can't be used
        //do the same with when they do below our threshold
    }
    
    
    //Getting the amount of time driver drove distracted
    func displayDistractedTime() {
        let amtDistrTime = defaults.getTimeDistracted()
        
        if (amtDistrTime == 0.0) {
//            self.debugLabel.text = "Distracted Time: 0:00"
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
//        self.debugLabel.text = "Distracted Time:
        
    }
    
    func calculateDrivingPercentage() {
        let distrTime = defaults.getTimeDistracted()
        
        if (distrTime == 0.0) {
            self.percentageLabel.text = "100%"
            
            self.percentage = 100
        } else {
            let percentage = floor(100 - (100 * (distrTime / self.totalTime)))
            
            self.percentage = Int(percentage)
            
            self.percentageLabel.text = "\(self.percentage)%"
            
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
        
        hb.formatTimeForLabel(time: self.totalTime, label: self.driveTime)
        
        //example
//        
//        var minutes = floor(timePastDriveStart / 60)
//        var seconds = round(timePastDriveStart - minutes * 60)
//        
//        var minutesString = ""
//        var secondsString = ""
//        
//        //minutes calculated
//        minutes = floor(minutes)
//        let minInt:Int = Int(minutes)
//        if minutes <= 9 {
//            
//            minutesString = "0\(minInt)"
//        } else {
//            
//            minutesString = "\(minInt)"
//        }
//        
//        //seconds calculated
//        seconds = floor(seconds)
//        let secInt:Int = Int(seconds)
//        if seconds <= 9 {
//            
//            secondsString = "0\(secInt)"
//        } else {
//            secondsString = "\(secInt)"
//        }
//    
//        //setting the label after all of the formatting
//        self.driveTime.text = "\(minutesString):\(secondsString)"
    }
    
    //Creating the parse object to upload 
    func createTrip(tripTime: TimeInterval, dateStart: Date, distractedTime: TimeInterval, drivePercentage: Int, email: String) {
        
        let trip = PFObject(className: "Trip")
        trip["tripTime"] = tripTime
        trip["dateStart"] = dateStart
        trip["drivePercentage"] = drivePercentage
        trip["email"] = email
        trip.saveInBackground {
            (success: Bool, error: Error?) -> Void in
            if (success) {
                print("Trip has been created. ")
            } else {
                // There was a problem, check error.description
                print("There was an error: \(String(describing: error?.localizedDescription))")
            }
        }
        
    }

}

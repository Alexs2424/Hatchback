//
//  DriveViewController.swift
//  Hatchback
//
//  Created by Alex Santarelli on 7/11/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import UIKit
import CoreLocation

class DriveViewController: UIViewController, CLLocationManagerDelegate {
    
    //Global Variables
    let locationManager = CLLocationManager()
    var timer:Timer = Timer()
    var startTime:TimeInterval = 0.0
    let hb = HB()
    let defaults = DriveDefaults()
    
    @IBOutlet weak var timerLabel:UILabel!
    @IBOutlet weak var speedometer: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Drive"
        
        //Location manager setup
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        defaults.setDriveStartDateForNow()
      
        self.setTimer()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        defaults.setLeftAppUnflagged()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("DriveViewController -- MemoryWarning")
    }
    
    @IBAction func openMusic(_ sender: Any) {
        let appleMusicLink = "music://"
        let spotifyMusicLink = "spotify://"
        openApp(appURLString: spotifyMusicLink)

        
    }

    @IBAction func openMaps(_ sender: Any) {
        let mapsLink = "maps://"
        let googleMapsLink = "comgooglemaps://"
        openApp(appURLString: googleMapsLink)
    }
    
    @IBAction func endButton(_ sender: Any) {
        self.endTimer()
        
        defaults.setDriveEndDateForNow()
        defaults.setDriveFinished()
        //bring up the ui for ending a drive
        //switching to drive end view, and save, 
        //the data that we need to pass.
        
        let endDriveVC = self.storyboard?.instantiateViewController(withIdentifier: "EndDrive") as! EndDriveViewController
        self.navigationController?.pushViewController(endDriveVC, animated: true)
    }

    
    func openApp(appURLString: String) {
        //We are leaving the app so we want to flag that they left it in the right way
        defaults.setLeftAppFlagged()
        
        if let url = URL(string: appURLString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: {(success: Bool)
                in if success {
                    print("Launching \(url)")
                
                } else {
                    print("There was an error")
                }})
        }
    }
    
    //timer related functions
    func setTimer() {
        let updateSelector : Selector = #selector(DriveViewController.updateTimer)
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: updateSelector, userInfo: nil, repeats: true) //was 0.01 // should be more if it does not affect performance
        startTime = Date.timeIntervalSinceReferenceDate
    }
    
    func updateTimer() {
        let currentTime = Date.timeIntervalSinceReferenceDate
        
        //Find the difference between current time and start time.
        var elapsedTime: TimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (TimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= TimeInterval(seconds)
        
        //we'll also update the speedometer
        self.updateSpeedometer()
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        timerLabel.text = "\(strMinutes):\(strSeconds)"
    }
    
    func endTimer() {
        let totalTime = Date.timeIntervalSinceReferenceDate - startTime
        print("The Total Time for that trip was: \(totalTime)")
        
        //stopping the timer
        timer.invalidate()
        
    }
    
    //spotify open url
    //spoitfy://  -> brings you to the your library portion of your spotify
    //spotify:app:browse //if we wanted to go deeper this is somewhat of how it would look
    
    //google maps
    //comgooglemaps://
    
    //apple music 
    //music://
    
    //apple maps 
    //maps://
    
    func updateSpeedometer() {
        var speed: CLLocationSpeed = CLLocationSpeed()
        speed = locationManager.location!.speed
        
        //DEBUG ONLY
        //print("DriveViewController -- Current Speed in Apple's format: \(speed)\nDriveViewController -- Current Speed in MPH: \(speed * 2.23693629)")
        
        speed *= 2.23693629 //2.23693629 constant makes it mph
        
        let speedString = String(format: "Current Speed --  %.02f", speed)
        
        self.speedometer.text = speedString
        

    }
}

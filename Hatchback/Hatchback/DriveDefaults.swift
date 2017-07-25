//
//  DriveDefaults.swift
//  Hatchback
//
//  Created by Alex Santarelli on 7/25/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import Foundation
import UIKit

class DriveDefaults {
    let START_DRIVE_TIME_KEY = "STARTTIME" //start time for the drive in date form
    let END_DRIVE_TIME_KEY = "ENDTIME" //end time for the drive in date form
    let START_DISTRACTED_TIME_KEY = "DISTSTARTTIME" //start time for being distracted, in date form
    let END_DISTRACTED_TIME_KEY = "DISTENDTIME" //end time for being distracted, in date form
    let DISTRACTED_TIME_KEY = "DISTRACTEDTIME" //total distracted time
    let LEFT_APP_UNFLAGGED_KEY = "LEFTUNFLAGGED" //if they're correctly leaving the app that they have
    let DRIVE_FINISHED_KEY = "DRIVEFINISHED"
    
    func setDriveStartDateForNow() {
        UserDefaults.standard.set(Date(), forKey: START_DRIVE_TIME_KEY)
    }
    
    func setStartDriveDistractedTime() {
        UserDefaults.standard.set(Date(), forKey: START_DISTRACTED_TIME_KEY)
    }
    
    func setDriveEndDateForNow() {
        UserDefaults.standard.set(Date(), forKey: END_DRIVE_TIME_KEY)
    }
    
    func setDriveEndDistractedTime() {
        UserDefaults.standard.set(Date(), forKey: END_DISTRACTED_TIME_KEY)
    }
    
    func setLeftAppUnflagged() {
        UserDefaults.standard.set(false, forKey: LEFT_APP_UNFLAGGED_KEY)
    }
    
    func setLeftAppFlagged() {
        UserDefaults.standard.set(true, forKey: LEFT_APP_UNFLAGGED_KEY)
    }
    
    func setDriveFinished() {
        UserDefaults.standard.set(true, forKey: DRIVE_FINISHED_KEY)
    }
    
    func setDriveNotFinished() {
        UserDefaults.standard.set(false, forKey: DRIVE_FINISHED_KEY)
    }
    
    func setTimeDistracted(time: TimeInterval) {
        var totalDistrTime:TimeInterval = UserDefaults.standard.object(forKey: DISTRACTED_TIME_KEY) as! TimeInterval
        totalDistrTime += time
        UserDefaults.standard.set(totalDistrTime, forKey: DISTRACTED_TIME_KEY)
    }
    
    func checkForAppLeftUnflagged() -> Bool {
        let result = UserDefaults.standard.bool(forKey: LEFT_APP_UNFLAGGED_KEY)
        return result
    }
    
    func clearAll() {
        //All defaults will be defaulted to nil 
        UserDefaults.standard.set(nil, forKey: START_DRIVE_TIME_KEY)
        UserDefaults.standard.set(nil, forKey: END_DRIVE_TIME_KEY)
        UserDefaults.standard.set(nil, forKey: START_DISTRACTED_TIME_KEY)
        UserDefaults.standard.set(nil, forKey: END_DISTRACTED_TIME_KEY)
        UserDefaults.standard.set(nil, forKey: DISTRACTED_TIME_KEY)
        UserDefaults.standard.set(nil, forKey: LEFT_APP_UNFLAGGED_KEY)
        UserDefaults.standard.set(nil, forKey: DRIVE_FINISHED_KEY)
    }
}


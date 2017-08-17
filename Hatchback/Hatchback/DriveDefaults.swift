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
    let START_DISTRACTED_DATE_KEY = "DISTRSTARTTIME" //start time for being distracted, in date form
    let END_DISTRACTED_DATE_KEY = "DISTENDTIME" //end time for being distracted, in date form
    let DISTRACTED_TIME_KEY = "DISTRACTEDTIME" //total distracted time
    let LEFT_APP_UNFLAGGED_KEY = "LEFTUNFLAGGED" //if they're correctly leaving the app that they have
    let DRIVE_FINISHED_KEY = "DRIVEFINISHED"
    let IN_DRIVE_KEY = "CURINDRIVE" //this defaults tell us whne you're in a drive and to be monitoring the background states
    let FIRST_TIME_KEY = "FIRSTTIME" //first time drive view appears. 
    
    //Previous Drive Keys, these are used for the dashboard
    let PREV_DRIVE_PERCENT = "PREVIOUSDRIVERPERCENTAGE"
    let PREV_DRIVE_TIME = "PREVIOUSDRIVEPERCENTAGE"
    
    //User Choice Keys, these are used for UIView Setup
    let CAR_CHOICE_KEY = "CARCHOICE"
    let REWARD_CHOICE_KEY = "REWARDCHOICE"
    
    func setDriveStartDateForNow() {
        UserDefaults.standard.set(Date(), forKey: START_DRIVE_TIME_KEY)
    }
    
    func setStartDriveDistractedDate() {
        let currentDate:Date = Date()
        UserDefaults.standard.set(currentDate, forKey: START_DISTRACTED_DATE_KEY)
    }
    
    func setDriveEndDateForNow() {
        UserDefaults.standard.set(Date(), forKey: END_DRIVE_TIME_KEY)
    }
    
    func setDriveEndDistractedDate() {
        UserDefaults.standard.set(Date(), forKey: END_DISTRACTED_DATE_KEY)
    }
    
    func setInDrive() {
        UserDefaults.standard.set(true, forKey: IN_DRIVE_KEY)
    }
    
    func setNotInDrive() {
        UserDefaults.standard.set(false, forKey: IN_DRIVE_KEY)
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
    
    func setIsFirstTime() {
        UserDefaults.standard.set(true, forKey: FIRST_TIME_KEY)
    }
    
    func setNotFirstTime() {
        UserDefaults.standard.set(false, forKey: FIRST_TIME_KEY)
    }
    
    func setCurrentlyInDrive() {
        UserDefaults.standard.set(true, forKey: IN_DRIVE_KEY)
    }
    
    func setPrevDrivePercentage(percentage: Int) {
        UserDefaults.standard.set(percentage, forKey: PREV_DRIVE_PERCENT)
    }
    
    func setPrevDriveTime(time: TimeInterval) {
        UserDefaults.standard.set(time, forKey: PREV_DRIVE_TIME)
    }
    
    func setCarChoice(num: Int) {
        //0 (default) is the jeep
        //1 bug
        //2 convertible
        switch num {
        case 0:
            UserDefaults.standard.set(0, forKey: CAR_CHOICE_KEY)
        case 1:
            UserDefaults.standard.set(1, forKey: CAR_CHOICE_KEY)
        case 2:
            UserDefaults.standard.set(2, forKey: CAR_CHOICE_KEY)
        default:
            UserDefaults.standard.set(0, forKey: CAR_CHOICE_KEY)
        }
    }
    
    func getCarChoice() -> Int {
        let number = UserDefaults.standard.integer(forKey: CAR_CHOICE_KEY)
        return number
    }
    
    func getDriveStatus() -> Bool {
        let inDrive = UserDefaults.standard.bool(forKey: IN_DRIVE_KEY)
        return inDrive
    }
    
    func setTimeDistracted(time: TimeInterval) {

        if UserDefaults.standard.object(forKey: DISTRACTED_TIME_KEY) == nil { //if this is the first time, we dont need to add it
            UserDefaults.standard.set(time, forKey: DISTRACTED_TIME_KEY)
        } else { // it isn't the first time so we need to add it for the total
            var totalDistrTime:TimeInterval = UserDefaults.standard.object(forKey: DISTRACTED_TIME_KEY) as! TimeInterval
            totalDistrTime += time
            UserDefaults.standard.set(totalDistrTime, forKey: DISTRACTED_TIME_KEY)
        }
        
    }
    
    func getFirstTime() -> Bool {
        let result = UserDefaults.standard.bool(forKey: FIRST_TIME_KEY)
        return result
    }
    
    func getDriveStartTime() -> Date {
        if UserDefaults.standard.object(forKey: START_DRIVE_TIME_KEY) == nil {
            print("There was an error retreiving the start time drive info")
        }
        let date = UserDefaults.standard.object(forKey: START_DRIVE_TIME_KEY) as! Date
        
        return date
    }
    
    func getDriveEndTime() -> Date {
        let date = UserDefaults.standard.object(forKey: END_DRIVE_TIME_KEY) as! Date
        return date
    }
    
    func getDistractedTimeStart() -> Date {
        let date = UserDefaults.standard.object(forKey: START_DISTRACTED_DATE_KEY) as! Date
        return date
    }
    
    //This should be changed becuase I don't believe it should be nil, and I don't think this is the best way to work with item
    
//    func getDistractedTimeStart() -> Date? { //optional because it can be nil, if the view starts without being distracted
//        if UserDefaults.standard.object(forKey: START_DISTRACTED_DATE_KEY) != nil {
//            let date = UserDefaults.standard.object(forKey: START_DISTRACTED_DATE_KEY) as! Date
//            return date
//        } else {
//
//        }
//
//    }
    
    func getTimeDistracted() -> TimeInterval {
        if UserDefaults.standard.object(forKey: DISTRACTED_TIME_KEY) == nil {
            return 0.0
        } else {
            let time = UserDefaults.standard.object(forKey: DISTRACTED_TIME_KEY) as! TimeInterval
            return time
        }
        
    }
    
    func getDistractedTimeEnd() -> Date {
        let date = UserDefaults.standard.object(forKey: END_DISTRACTED_DATE_KEY) as! Date
        return date
    }
    
    func checkForAppLeftUnflagged() -> Bool {
        let result = UserDefaults.standard.bool(forKey: LEFT_APP_UNFLAGGED_KEY)
        return result
    }
    
    func getPrevDrivePercentage() -> Int {
        
        if UserDefaults.standard.object(forKey: PREV_DRIVE_PERCENT) == nil {
            return 0
        } else {
            let percent = UserDefaults.standard.integer(forKey: PREV_DRIVE_PERCENT)
            return percent
        }
    }
    
    func getPrevDriveTime() -> TimeInterval {
        if UserDefaults.standard.object(forKey: PREV_DRIVE_TIME) == nil {
            return 0.0
        } else {
            let time = UserDefaults.standard.double(forKey: PREV_DRIVE_TIME)
            return time
        }
    }
    
    func resetAppLeftFlagged() {
        UserDefaults.standard.set(false, forKey: LEFT_APP_UNFLAGGED_KEY)
//        UserDefaults.standard.set(nil, forKey: LEFT_APP_UNFLAGGED_KEY)
//        UserDefaults.standard.removeObject(forKey: LEFT_APP_UNFLAGGED_KEY)
    }
    
    func debugDefaultStates() {
        print("--- Trip Defaults Information --- DriveDefaults")
        //Distracted Time
        if let distrTime = UserDefaults.standard.object(forKey: DISTRACTED_TIME_KEY) {
            print("Distracted Total Time:\t \(distrTime)")
        } else {
            print("NO Distracted Total Time.")
        }
        //Total Time
        let totalTime = self.displayTime()
        
        print("Total Time:\t \(totalTime)")
        
    }
    
    func clearAll() {
        //All defaults will be defaulted to nil 
        UserDefaults.standard.removeObject(forKey: START_DRIVE_TIME_KEY)
        UserDefaults.standard.removeObject(forKey: END_DRIVE_TIME_KEY)
        UserDefaults.standard.removeObject(forKey: START_DISTRACTED_DATE_KEY)
        UserDefaults.standard.removeObject(forKey: END_DISTRACTED_DATE_KEY)
        UserDefaults.standard.removeObject(forKey: DISTRACTED_TIME_KEY)
        UserDefaults.standard.removeObject(forKey: LEFT_APP_UNFLAGGED_KEY)
        UserDefaults.standard.removeObject(forKey: DRIVE_FINISHED_KEY)
    }
    
    
    //DEBUG Functions
    func displayTime() -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm"
        
        let startDriveDate = self.getDriveStartTime()
        let endDriveDate = self.getDriveEndTime()
        
        let timePastDriveStart = endDriveDate.timeIntervalSince(startDriveDate)
        //convert time passed into hours and minutes that we can display on the label
        
//        let totalTime = timePastDriveStart
        
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
        
        return "\(minutesString):\(secondsString)"
    }
}


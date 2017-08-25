//
//  DashboardUISetup.swift
//  Hatchback
//
//  Created by Alex Santarelli on 8/17/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import Foundation
import UIKit
import Graph2DFramework
import Parse

class DashboardUISetup {
    
    let defaults = DriveDefaults()
    
    let jeep = UIImage(named: "Jeep")
    let bug = UIImage(named: "Bug")
    let truck = UIImage(named: "Truck")
    
    init() {
        //self.setGraphPoint()
    }
    
    func queryForPastWeekTrips() {
        let query = PFQuery(className: "Trips")

    }
    
    func getCarImage() -> UIImage {
        let choice = defaults.getCarChoice()
        
        switch choice {
        case 0:
            return jeep!
        case 1:
            return bug!
        case 2:
            return truck!
        default:
            return jeep!
        }
    }
    
    func setGraphPoint(percentage: Int) -> pointForGraph {
        var xPos = 0 //this will be assigned once we figure out which weekday it is
        //graph starts at friday from the left and then works its way over
        
        //formula for the y value =  absolute value of ( actual number - 100 )
        
        
        
        switch self.getDayOfWeek("2014-08-23")! {

        case 1:
            print("Sunday") //24
            xPos = 28
        case 2:
            print("Monday") //25
            xPos = 42
        case 3:
            print("Tuesday") //26
            xPos = 56
        case 4:
            print("Wednesday") //27
            xPos = 70
        case 5:
            print("Thursday") //28
            xPos = 84
        case 6:
            print("Friday") //29
            xPos = 0
        case 7:
            print("Saturday") //23
            xPos = 14
        default:
            print("Weird thing, it must be a monday.")
            xPos = 0
        }
        
        let yPos = abs(percentage - 100)
        
        return pointForGraph.init(fromX: Double(xPos), fromY: Double(yPos))
        
        /* 
         pointForGraph.init(fromX: 0, fromY: abs(0 - 100)),
         pointForGraph.init(fromX: 14, fromY: abs(25 - 100)),
         pointForGraph.init(fromX: 28, fromY: abs(50 - 100)),
         pointForGraph.init(fromX: 42, fromY: abs(25 - 100)),
         pointForGraph.init(fromX: 56, fromY: abs(75 - 100)),
         pointForGraph.init(fromX: 70, fromY: abs(90 - 100)),
         pointForGraph.init(fromX: 84, fromY: abs(100 - 100)) 
         */
    }
 
    func getRewardImage() {
        //find out if they are sponsored or using kiip
        //from the defaults
        //decide then what percentage they're at raising their goal
    }
 
    private func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
}

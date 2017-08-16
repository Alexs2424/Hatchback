//
//  DashboardTabelViewController.swift
//  Hatchback
//
//  Created by Alex Santarelli on 8/14/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class DashboardTableViewController: PFQueryTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* REQUIRED PFQUERYTABLEVIEWCONTROLLER FUNCTIONS */
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // Configure the PFQueryTableView
        self.parseClassName = "Trip"
        self.textKey = "email"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    override func queryForTable() -> PFQuery<PFObject>{
        let query = PFQuery(className: "Trip")
        query.order(byDescending: "createdAt")
        
        if self.objects?.count == 0 {
            query.cachePolicy = PFCachePolicy.cacheThenNetwork
        }
        
        return query
    }
    
    /* END REQUIRED PFQUERYTABLEVIEWCONTROLLER FUNCTIONS */
    
    /* START TABLE VIEW CONTROLLER DELEGATE FUCNTIONS */
    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath, object: PFObject?) -> PFTableViewCell? {
        
        var dashCell = tableView.dequeueReusableCell(withIdentifier: "dashcell") as! DashbaordCell!
        
        if dashCell == nil {
            dashCell = DashbaordCell(style: UITableViewCellStyle.default, reuseIdentifier: "dashcell")
        }
        
        if let trip = object {
            //setting the day label
            let date = trip["dateStart"] as! Date
            dashCell?.dayLabel.text = date.timeAgoSinceNow()
            
            //grabbing the time that the drive started at
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:MM a"
            dateFormatter.timeZone = TimeZone(abbreviation: "EST")
            var stringFromDate = dateFormatter.string(from: date)
            
            //converting the total duration of the trip
            let secondsDriven:TimeInterval = trip["tripTime"] as! TimeInterval
            let minutesDriven:TimeInterval = secondsDriven / 60
            let minutesDrivenDouble:Double = minutesDriven as Double
            var minsDriven = Int(minutesDrivenDouble)
            //then we want to display hours and minutes
            
            //setting the duration info label
            
            //Removing the leading 0 from posts
            if stringFromDate.characters.first == "0" {
                stringFromDate.characters.removeFirst()
            }

            if minsDriven > 59 {
                let hoursDriven = Int(minsDriven / 60)
                minsDriven -= (hoursDriven * 60)
                
                if hoursDriven > 1 {
                    dashCell?.timeDurationLabel.text = "\(stringFromDate.lowercased()) - \(hoursDriven) hrs \(minsDriven) minutes"
                } else {
                    dashCell?.timeDurationLabel.text = "\(stringFromDate.lowercased()) - \(hoursDriven) hr \(minsDriven) minutes"
                }
                
            } else {
                dashCell?.timeDurationLabel.text = "\(stringFromDate.lowercased()) - \(minsDriven) minutes"
            }
//            let hoursDriven:TimeInterval = minutesDriven / 60
            
            //setting the percentage label 
            let percentage = trip["drivePercentage"] as! Double
            dashCell?.drivePercentageLabel.text = "\(Int(percentage))%"

            
        }
        
        return dashCell
    
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TEMP UNTIL WE FILL THIS ACTION OR DECIDE THERE'S NO ACTION HERE
        tableView.deselectRow(at: indexPath, animated: true)
    }
    /* END TABLE VIEW CONTROLLER DELEGATE FUNCTIONS */

}

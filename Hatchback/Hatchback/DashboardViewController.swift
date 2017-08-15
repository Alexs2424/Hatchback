//
//  FirstViewController.swift
//  Hatchback
//
//  Created by Alex Santarelli on 7/11/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Graph2DFramework

class DashboardViewController: UIViewController, Graph2DDelegate {
    
    @IBOutlet weak var lastDriveGraph: graph2D!
    
    private let testGraphPoints = [pointForGraph.init(fromX: 0, fromY: abs(0 - 100)),
                                   pointForGraph.init(fromX: 14, fromY: abs(25 - 100)),
                                   pointForGraph.init(fromX: 28, fromY: abs(50 - 100)),
                                   pointForGraph.init(fromX: 42, fromY: abs(25 - 100)),
                                   pointForGraph.init(fromX: 42, fromY: abs(100 - 100)),
                                   pointForGraph.init(fromX: 56, fromY: abs(75 - 100)),
                                   pointForGraph.init(fromX: 70, fromY: abs(90 - 100)),
                                   pointForGraph.init(fromX: 84, fromY: abs(100 - 100))]
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = DriveDefaults()
        defaults.clearAll()
        defaults.setNotInDrive()
        
        //Setting up the graph 
        self.lastDriveGraph.delegate = self
        self.lastDriveGraph.graphPoints = self.testGraphPoints
        //to create the test data
        //self.setTestTripData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setTestTripData() {
        //arrays of the test data that we are going to use
        
        //setting up date test data
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
        let date1 = dateFormatter.date(from: "05-08-2017")
        let date2 = dateFormatter.date(from: "08-08-2017")
        let date3 = dateFormatter.date(from: "10-08-2017")
        let date4 = dateFormatter.date(from: "11-08-2017")
        let date5 = dateFormatter.date(from: "09-08-2017")
        let date6 = dateFormatter.date(from: "13-08-2017")
        
        let startDates = [Date(), date1, date2, date3, date4, date5, date6]
        
        //Trip Times 
        let tripTimes = [11100, 3300, 23344, 2330, 34122, 9000, 34444, 111111, 222, 676777, 100000]
        
        for i in stride(from: 0, to: 12, by: 1) {
            let trip = PFObject(className:"Trip")
            trip["email"] = "alexszandc@gmail.com"
            trip["tripTime"] = tripTimes[Int(arc4random_uniform(9))]
            trip["dateStart"] = startDates[Int(arc4random_uniform(5))]
            trip.saveInBackground {
                (success: Bool, error: Error?) -> Void in
                if (success) {
                    print("Test Data Object num: \(i) has been saved succesfully.")
                } else {
                    // There was a problem, check error.description
                    print("There was a really annoying parse error \(String(describing: error?.localizedDescription))")
                }
            }

        }
        
    }
    
    /* 2DGRAPH DELEGATE */
    func circlePointSelectedOnGraph(indexSelectedName: String) {
        print("Graph delegate responding")
    }
    
    /* END DELEGATE FUNCTIONS */

}


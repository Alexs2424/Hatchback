//
//  WeeklyHistoryViewController.swift
//  Hatchback
//
//  Created by Alex Santarelli on 7/13/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import UIKit
import Graph2DFramework

class WeeklyHistoryViewController: UIViewController, Graph2DDelegate {
    
    @IBOutlet weak var weekHistoryGraph: graph2D!
    
    
    private let testGraphPoints = [pointForGraph.init(fromX: 0, fromY: abs(0 - 100)),
                                   pointForGraph.init(fromX: 14, fromY: abs(25 - 100)),
                                   pointForGraph.init(fromX: 28, fromY: abs(50 - 100)),
                                   pointForGraph.init(fromX: 42, fromY: abs(25 - 100)),
                                   pointForGraph.init(fromX: 56, fromY: abs(75 - 100)),
                                   pointForGraph.init(fromX: 70, fromY: abs(90 - 100)),
                                   pointForGraph.init(fromX: 84, fromY: abs(100 - 100))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "History"
        
        //Setting up the graph
        self.weekHistoryGraph.delegate = self
        self.weekHistoryGraph.graphPoints = self.testGraphPoints
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* 2DGRAPH DELEGATE */
    func circlePointSelectedOnGraph(indexSelectedName: String) {
        print("Graph delegate responding")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

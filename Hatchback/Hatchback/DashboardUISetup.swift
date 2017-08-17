//
//  DashboardUISetup.swift
//  Hatchback
//
//  Created by Alex Santarelli on 8/17/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import Foundation
import UIKit

class DashboardUISetup {
    
    let defaults = DriveDefaults()
    
    let jeep = UIImage(named: "Jeep")
    let bug = UIImage(named: "Bug")
    let convertible = UIImage(named: "Convertible")
    
    func getCarImage() -> UIImage {
        let choice = defaults.getCarChoice()
        
        switch choice {
        case 0:
            return jeep!
        case 1:
            return bug!
        case 2:
            return convertible!
        default:
            return jeep!
        }
    }
    
    func getRewardImage() {
        
    }
    
}

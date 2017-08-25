//
//  SettingsUISetup.swift
//  Hatchback
//
//  Created by Alex Santarelli on 8/24/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import Foundation
import UIKit

class SettingsUISetup {
    
    let driveDefaults = DriveDefaults()
    
    let jeep:UIImage
    let bug:UIImage
    let truck:UIImage
    
    init() {
        self.jeep = UIImage(named: "Jeep Profile")!
        self.bug = UIImage(named: "Bug Profile")!
        self.truck = UIImage(named: "Truck Profile")!
    }

    func setProfile() -> UIImage {
        let choice = driveDefaults.getCarChoice()
        
        switch choice {
        case 0:
            return self.jeep
        case 1:
            return self.bug
        case 2:
            return self.truck
        default:
            return self.jeep
        }
    }
    
}

//
//  DashboardConstraints.swift
//  Hatchback
//
//  Created by Alex Santarelli on 8/18/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import Foundation
import UIKit

class DashboardConstraints {
    
    let tile1:UIButton
    let tile2:UIButton
    let tile3:UIButton
    let view:UIView
    let topLayoutGuide: UILayoutSupport
    
    //constants for the elements we will write the constraints for.
    //format: <element name> + <element attribute> + <device constraint is for>  // i.e 7 --> iPhone 7, 7P --> iPhone 7 Plus
    let tileWidth7P:CGFloat = 0 //not being used at this time.

    let tileWidth7:CGFloat = 161
    let tileWidth5:CGFloat = 140
    
    //these apply to all tiles, 1, 2, & 3 
    let tileHeight7P:CGFloat = 0
    let tileHeight7:CGFloat = 161
    let tileHeight5:CGFloat = 140
    
    //start drive constants
    let startDriveWidth7P:CGFloat = 0
    let startDriveWidth7:CGFloat = 334
    let startDriveWidth5:CGFloat = 288
    
    //tiles 1 & 2 position constants
    let tileLeading7P:CGFloat = 0
    let tileLeading7:CGFloat = 4
    let tileLeading5:CGFloat = 0 //at margin 
    
    let tileTrailing7P:CGFloat = 0
    let tileTrailing7:CGFloat = 4
    let tileTrailing5:CGFloat = 0
    
    let tileVertical7P:CGFloat = 0
    let tileVertival7:CGFloat = 12
    let tileVertical5:CGFloat = 8
    
    
    
    //variables to be used in the class
    let hb = HB()
    
    //constant to be intialized 
    let device:String
    
    init(tile1:UIButton, tile2:UIButton, tile3:UIButton, view: UIView, topLayoutGuide: UILayoutSupport) {
        self.tile1 = tile1
        self.tile2 = tile2
        self.tile3 = tile3
        self.view = view
        self.topLayoutGuide = topLayoutGuide
        device = hb.getDeviceSize()
    }
    
    func setConstraints() {
        switch device {
        case "7P":
            self.setiPhone7Constraints() // CHANGE BUT TEMP TRUE
        case "7":
            self.setiPhone7Constraints()
        case "5":
            self.setiPhone5Constraints()
        default:
            self.setiPhone7Constraints()
        }
    }
    
    /* 
    Call to create a new dashConstraint, 
    We NEED to pass and collect the uiview and layout guide here too.
     (view: UIView,
     topLayoutGuide: UILayoutSupport,
     tile1: UIButton,
     tile2: UIButton,
     tile3: UIButton,
     tile_1_2_Width: CGFloat,
     tile_1_2_3_Height: CGFloat,
     tile3Width: CGFloat,
     tileLeading: CGFloat,
     tileTrailing: CGFloat,
     tileVertical: CGFloat)
 */
    func setiPhone7PConstraints() {
 
    }
 
    func setiPhone7Constraints() -> [NSLayoutConstraint] {
        let constraintsForiPhone7 = dashConstraints(view: self.view,
                                                    topLayoutGuide: self.topLayoutGuide,
                                                    tile1: self.tile1,
                                                    tile2: self.tile2,
                                                    tile3: self.tile3,
                                                    tile_1_2_Width: self.tileWidth7,
                                                    tile_1_2_3_Height: self.tileHeight7,
                                                    tile3Width: self.startDriveWidth7,
                                                    tileLeading: self.tileLeading7,
                                                    tileTrailing: self.tileTrailing7,
                                                    tileVertical: self.tileVertival7)
        let constraints = constraintsForiPhone7.setConstraints()
        return constraints
    }
    
    func setiPhone5Constraints() {
        
    }
    
    
    
    
}

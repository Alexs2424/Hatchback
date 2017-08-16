//
//  HBConstants.swift
//  Hatchback
//
//  Created by Alex Santarelli on 7/20/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import Foundation
import UIKit

class HB {
    let APP_LEAVING_KEY:String = "APPLEAVING"
    
    func formatTimeForLabel(time: TimeInterval, label: UILabel) {

        let minutes = floor(time / 60)
        let seconds = round(time - minutes * 60)
        
        var minString = ""
        var secString = ""
        
        //calculating how to display minutes
        let minInt = Int(minutes)
        if minInt <= 9 {
            minString = "0\(minInt)"
        } else {
            minString = "\(minInt)"
        }
        
        //calculating seconds to display
        let secInt = Int(seconds)
        if secInt <= 9 {
            secString = "0\(secString)"
        } else {
            secString = "\(secString)"
        }
        
        label.text = "\(minString):\(secString)"
    }
}

//
//  KiipRewardManager.swift
//  Hatchback
//
//  Created by Alex Santarelli on 8/16/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import Foundation

class KiipRewardManager {
    
    func presentKiipReward() {
        Kiip.sharedInstance().saveMoment("No texting while driving.", withCompletionHandler: {
            (poptart:KPPoptart!, error:Error!) -> Void in
            
            //If we can unwrap this successfully that means the error actually exists
            if let kiipSDKError = error {
                print("There was an SDK Error with Kiip -- \(kiipSDKError.localizedDescription)")
            } else {
                print("No SDK Error.") //this will be removed after debug phase
            }
            
            //Unwrapping the Poptart 
            if let kiipPopTart = poptart {
                kiipPopTart.show()
            } else {
                print("Successful moment, but no reward to give, so there was an error.")
            }
        })
    }
    
}

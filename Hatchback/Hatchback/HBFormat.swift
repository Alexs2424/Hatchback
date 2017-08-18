//
//  HBConstants.swift
//  Hatchback
//
//  Created by Alex Santarelli on 7/20/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import Foundation
import UIKit
import Parse

class HB {
    
    //App Keys for database
    private let APPLICATION_ID_KEY = "vHOMNx9oySuKL32PYmX4eljf"
    private let CLIENT_KEY = "YO6eUzEIiylXhxGNuFpbss5z6NliC2vD"
    private let SERVER_URL = "https://hatchback.herokuapp.com/parse"
    
    //App Keys for Kiip
    private let KP_APP_KEY: String = "15c3ef65d126cbfb7e444c6f402bebcd"
    private let KP_APP_SECRET: String = "2d18b06671ed10239a8a4cc7f0c8f342"
    
    //The only defaults that DO NOT Reside in the Drive Defaults
    let DEVICE_SIZE_KEY  = "DEVICESIZE"
    
    func getClientServerConfiguration() -> ParseClientConfiguration {
        let clientConfig = ParseClientConfiguration {
            $0.applicationId = self.APPLICATION_ID_KEY
            $0.clientKey = self.CLIENT_KEY
            $0.server = self.SERVER_URL
        }
        
        return clientConfig
    }
    
    func getKiipInstance() -> Kiip {
         return Kiip(appKey: KP_APP_KEY, andSecret: KP_APP_SECRET)
    }
    
    func setDeviceSize(deviceHeight: CGFloat) {
        let arrayOfDeviceSizes:[CGFloat] = [480.0, 568.0, 667.0, 736.0] //[0] is not possible with this deployment of ios
        
        switch deviceHeight {
        case arrayOfDeviceSizes[0]:
            print("iPhone 4 has been set as the main deivce. ")
            //this shouldn't be able to happen.
            UserDefaults.standard.set("4", forKey: DEVICE_SIZE_KEY)
        case arrayOfDeviceSizes[1]:
            print("iPhone 5 has been set as the main device.")
            UserDefaults.standard.set("5", forKey: DEVICE_SIZE_KEY)
        case arrayOfDeviceSizes[2]:
            print("iPhone 7 has been set as the main device.")
            UserDefaults.standard.set("7", forKey: DEVICE_SIZE_KEY)
        case arrayOfDeviceSizes[3]:
            print("iPhone 7P has been set as the main device.")
            UserDefaults.standard.set("7P", forKey: DEVICE_SIZE_KEY)
        default:
            print("iPhone 7 has been set as the main device.")
            UserDefaults.standard.set("7", forKey: DEVICE_SIZE_KEY)
        }
    }
    
    func getDeviceSize() -> String { // 4, 5, 7, 7P are the possilbe returns you will get
        let currentDevice = UserDefaults.standard.string(forKey: DEVICE_SIZE_KEY)
        return currentDevice!
    }
    
    //Formats time labels, it's fairly common in the UI, so it's easier to have this to do it for you.
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
        
        if minString.characters.first == "0" {
            minString.characters.removeFirst()
        }
        
        //calculating seconds to display
        let secInt = Int(seconds)
        if secInt <= 9 {
            secString = "0\(secInt)"
        } else {
            secString = "\(secInt)"
        }
        
        label.text = "\(minString):\(secString)"
    }
}

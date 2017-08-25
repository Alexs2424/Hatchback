//
//  SettingsViewController.swift
//  Hatchback
//
//  Created by Alex Santarelli on 7/11/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let settingsUI = SettingsUISetup()
    
    @IBOutlet weak var profileImage:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Settings"

        self.profileImage.image = self.settingsUI.setProfile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

//
//  SettingsViewController.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 20/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // Add view did load in all these view controllers
    
    // Restore navigation bar that was removed from the root view controller?
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
}

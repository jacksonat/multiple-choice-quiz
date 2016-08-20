//
//  SettingsViewController.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 20/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var gameModeButtons: [UIView]!
    
    @IBAction func gameModeButtonHandler(sender: UIButton) {
        
        for button in gameModeButtons {
        
            if sender != button {
            
                // Set the unselected buttons to transparent
                button.alpha = 0.7
            
            } else {
            
                button.alpha = 1.0
                
                gameMode = button.tag
            
            }
        
        }
        
    }
    
    @IBAction func playButtonHandler(sender: AnyObject) {
    }
    
    var gameMode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for (index, button) in gameModeButtons.enumerate() {
        
            button.tag = index
            
            // set the multiple choice as the default selection, so ignore it in the alpha reduction
            if button.tag != 0 {
            
                button.alpha = 0.7
            
            }
        
        }
        
    }
    
    // Restore navigation bar
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

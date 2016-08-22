//
//  ViewController.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 20/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        loadQuizData()
    
    }
    
    // Remove navigation bar from root view controller
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadQuizData() {
    
       /*
        
        // Multiple Choice Data
        let pathMC = NSBundle.mainBundle().pathForResource("MCQuestions", ofType: "plist")
        let dictMC = NSDictionary(contentsOfFile: pathMC!)
        
        // This stores the questions in multipleChoiceArray. Could just hardcode the array in the config file if want to avoid plist. Downsides?
        // This line below failed at run time. Reverting to not using plist but putting questions in linked config file
        // multipleChoiceArray = dictMC!["Questions"]!.mutableCopy as! Array
    
        check()
 
        */
        
        check()
 
    }
 
    
    func check(){
    
        print(QuestionsList)
    
    }


}


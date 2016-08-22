//
//  MultipleChoiceViewController.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 20/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    
    @IBAction func answerButtonHandler(sender: UIButton) {
    
        //if sender.index = answer
        // light up green
        //else light up red
        
        // pop the Questions array
        
        // timer of 3 seconds
        // call next Question
        
        if sender.titleLabel!.text == correctAnswer {
        
            print("Correct")
        
        } else {
        
            print("Incorrect")
        
        }
    
    }
    
    var correctAnswer = "2016"
    
    var answers = ["1980", "1972", "2016", "1990"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        titlesForButtons()
    
    }
    
    // func setQuestion() {
    
        // var questionToAsk = Questions * random
        // titlesforButtons() {
    
            // question.text = question
            // cycle through array for answer labels
    
    //    }
    

    
   
    
    func titlesForButtons() {
    
        for (index, button) in answerButtons.enumerate() {
            
            button.setTitle(answers[index], forState: .Normal)
            
        questionLabel.text = "What year is it?"
            
        }

    
    }
    
    
}

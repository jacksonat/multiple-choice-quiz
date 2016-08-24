//
//  MultipleChoiceViewController.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 20/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    var correctAnswer = Int()  // Initialize the correctAnswer
    
    // var QNumber = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    
    @IBOutlet weak var questionButton: UIButton!
    
    
    @IBAction func questionButtonHandler(sender: UIButton) {
    
    
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setQuestion()
        
    }
    
    
    @IBAction func answerButtonHandler(sender: UIButton) {
    
        // Disable buttons after answer selection
        for button in answerButtons {
        
            button.enabled = false
        
        }
        
        checkAnswer(sender)
        
    }
    

    
    func setQuestion() {
        
        if QuestionsList.count > 0 {
            
            // Add a randomizer on this
            let QNumber = Int(arc4random_uniform(UInt32(QuestionsList.count)))
            
            // Test on randomizer on QuestionsList array
            print("QNumber is \(QNumber), with \(QuestionsList.count) questions left")
            
            // Check this method
            //questionLabel.titleLabel!.lineBreakMode = .ByWordWrapping
            questionLabel.text = QuestionsList[QNumber].Question
            
            for i in 0..<answerButtons.count {
            
                // Check this method
                // answerButtons[i].titleLabel!.lineBreakMode = .ByWordWrapping
                answerButtons[i].setTitle(QuestionsList[QNumber].Answers![i], forState: UIControlState.Normal)
            
            }
            
        // Set the correctAnswer number before popping the question from array
        correctAnswer = QuestionsList[QNumber].Answer
            
        // Remove the asked question from the array
        QuestionsList.removeAtIndex(QNumber)  // You will need to reload the full array after the end of the game
            
            
        
        } else {
        
            // Do something at finish
            print("No more questions")
        
        }
        
    }
    
    func checkAnswer(sender: UIButton) {
        
        if sender.tag == correctAnswer {
            
            print("Correct")
            
        } else {
            
            print("Incorrect")
            
        }
        
        // this function will be placed into a tap to proceed action handler rather than auto advancing
        // setQuestion()
    
    }
    
}

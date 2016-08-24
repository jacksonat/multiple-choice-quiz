//
//  MultipleChoiceViewController.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 20/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    var correctAnswer: Int = 0
    
    // var QNumber = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setQuestion()
        
    }
    
    
    @IBAction func answerButtonHandler(sender: UIButton) {
    
        checkAnswer(sender)
        
    }
    

    
    func setQuestion() {
        
        if QuestionsList.count > 0 {
            
            // Add a randomizer on this
            let QNumber = Int(arc4random_uniform(UInt32(QuestionsList.count)))
            print("QNumber = \(QNumber)")
            
            questionLabel.text = QuestionsList[QNumber].Question
            
            for i in 0..<answerButtons.count {
            
                answerButtons[i].setTitle(QuestionsList[QNumber].Answers![i], forState: UIControlState.Normal)
            
            }
            
        // Set the correctAnswer number before popping the question from array
        correctAnswer = QuestionsList[QNumber].Answer
            
        // Remove the asked question from the array
        QuestionsList.removeAtIndex(QNumber)
        
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
        
        setQuestion()
    
    }
    
}

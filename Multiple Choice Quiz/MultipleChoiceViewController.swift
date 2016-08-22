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
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    
    @IBAction func answerButtonHandler(sender: UIButton) {
    
        if sender.tag == correctAnswer {
            
            print("Correct")
            
        } else {
            
            print("Incorrect")
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        setQuestion()
        
    }
    
    func setQuestion() {
        
        // var questionToAsk = Questions * random
        // titlesforButtons() {
        
        // question.text = question
        // cycle through array for answer labels
        
        //    }
        
        if QuestionsList.count > 0 {
        
            var QNumber = 0
            
            questionLabel.text = QuestionsList[QNumber].Question
            
            for i in 0..<answerButtons.count {
            
                answerButtons[i].setTitle(QuestionsList[QNumber].Answers![i], forState: UIControlState.Normal)
                
            correctAnswer = QuestionsList[QNumber].Answer
            
            }
        
        } else {
        
            // Do something at finish
            print("No more questions")
        
        }
        
    }
    
}

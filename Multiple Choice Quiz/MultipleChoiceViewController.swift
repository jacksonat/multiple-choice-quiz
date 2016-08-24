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
    
    let initialQuestionCount = QuestionsList.count
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBOutlet weak var questionButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func questionButtonHandler(sender: UIButton) {
    
        setQuestion()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        progressView.progress = 0
        
        setQuestion()
        
    }
    
    
    @IBAction func answerButtonHandler(sender: UIButton) {
    
        // Disable buttons after answer selection
        for button in answerButtons {
        
            button.enabled = false
        
        }
        
        // Check the answer
        checkAnswer(sender)
        
    }
    

    
    func setQuestion() {
        
        if QuestionsList.count > 0 {
            
            // increment the progress bar
            progressView.progress += 1 / Float(initialQuestionCount)
            
            // Disable the question button. (Alertnatively place in viewDidLoad?)
            questionButton.enabled = false
            
            // Add a randomizer on this
            let QNumber = Int(arc4random_uniform(UInt32(QuestionsList.count)))
            
            // Test on randomizer on QuestionsList array
            print("QNumber is \(QNumber), with \(QuestionsList.count) questions left")
            
            questionLabel.lineBreakMode = .ByWordWrapping
            
            questionLabel.text = QuestionsList[QNumber].Question
            
            for (index, button) in answerButtons.enumerate() {
            
                button.enabled = true
                
                button.setTitle(QuestionsList[QNumber].Answers![index], forState: UIControlState.Normal)
                
                button.backgroundColor = UIColor(red: 161/255, green: 228/255, blue: 231/255, alpha: 1)
                
                button.titleLabel!.lineBreakMode = .ByWordWrapping
 
            }
            
        // Set the correctAnswer number before popping the question from array
        correctAnswer = QuestionsList[QNumber].Answer
            
        // Remove the asked question from the array
        QuestionsList.removeAtIndex(QNumber)  // You will need to reload the full array after the end of the game
            
            
        
        } else {
        
            // Do something at finish - load a New Game question, repopulate array, setQuestion() again
            print("No more questions")
        
        }
        
    }
    
    func checkAnswer(sender: UIButton) {
        
        answerButtons[correctAnswer].backgroundColor = UIColor.greenColor()
        
        if sender.tag == correctAnswer {
            
            print("Correct")
            
        } else {
            
            print("Incorrect")
            
            sender.backgroundColor = UIColor.redColor()
            
        }
        
        questionButton.enabled = true
    
    }
    
}

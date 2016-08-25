//
//  MultipleChoiceViewController.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 20/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

// Note - system sounds are not working on the Simulator but do work on the device

import UIKit
import AudioToolbox

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
        
        // I am having problems with scope. Can't add things like setting up the AudioServicesCreateSystemSoundID outside a function. Can't put it in viewDidLoad because I can't reach it from checkAnswer function. So have to put it here which means I am creating it every time I call this function
        
        let soundUrl = NSBundle.mainBundle().URLForResource("xylophone_affirm1", withExtension: "wav")
        
        var mySound: SystemSoundID = 0
        
        AudioServicesCreateSystemSoundID(soundUrl!, &mySound)
        
        // let url = NSURL.fileURLWithPath(NSBundle.mainBundle(path))
        
        answerButtons[correctAnswer].backgroundColor = UIColor.greenColor()
        
        if sender.tag == correctAnswer {
            
            print("Correct")
            
            AudioServicesPlaySystemSound(SystemSoundID(mySound))
            
        } else {
            
            print("Incorrect")
            
            sender.backgroundColor = UIColor.redColor()
            
            AudioServicesPlaySystemSound(SystemSoundID(1000))
            
        }
        
        questionButton.enabled = true
        
        if QuestionsList.count == 0 {
        
            // add a 2 second timer here - set up an NSTimer
            backToMenu()
            
            // need to repopulate QuestionsList array
            // Note - he is shuffling the array, he is not popping from it, so try that. It means your array always has items does't it? To cycle through it, you just keep moving the index number up by one.
        
        }
    
    }
    
    
    
    func backToMenu() {
    
        navigationController?.popToRootViewControllerAnimated(true)
    
    }
    
}

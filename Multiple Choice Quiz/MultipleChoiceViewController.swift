//
//  MultipleChoiceViewController.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 20/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

// Note - system sounds are not working on the Simulator but do work on the device

// Refactored code so you do not remove items from the array. Rather, grab the Question from the array at item n, assign that to a variable, then go through the rest of the array doing this by n++. This leaves the initial array in place, and you then just shuffle it on every new game.

import UIKit
import AudioToolbox

class MultipleChoiceViewController: UIViewController {

    var correctAnswer = Int()  // Initialize the correctAnswer
    
    // Set a fixed QNumber, not random, because you are shuffling the array not the index
    var QNumber = 0
    
    // now redundant
    let initialQuestionCount = QuestionsList.count
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBOutlet weak var questionButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func questionButtonHandler(sender: UIButton) {
    
        if QNumber < (QuestionsList.count - 1) {
        
            QNumber += 1
            
            setQuestion()
            
        } else {
        
            backToMenu()
        
        }
        
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
        
        if QNumber < QuestionsList.count {
            
            let currentQuestion = QuestionsList[QNumber]
            
            // increment the progress bar
            progressView.progress += 1 / Float(QuestionsList.count)
            
            // Disable the question button. (Alertnatively place in viewDidLoad?)
            questionButton.enabled = false
            
            // Test on progress in the QuestionsList array
            print("QNumber is \(QNumber), with \((QuestionsList.count - 1) - QNumber) questions left")
            
            questionLabel.lineBreakMode = .ByWordWrapping  // put this in ViewDidLoad?
            
            questionLabel.text = currentQuestion.Question
            
            
            // Consider changin this to a random number allocation. It can get too predictable where the answers are on repeat plays
            for (index, button) in answerButtons.enumerate() {
            
                button.enabled = true
                
                button.setTitle(currentQuestion.Answers![index], forState: UIControlState.Normal)  // refactor for safe unwrapping
                
                button.backgroundColor = UIColor(red: 161/255, green: 228/255, blue: 231/255, alpha: 1)
                
                button.titleLabel!.lineBreakMode = .ByWordWrapping
 
            }
            
            // Set the correctAnswer 
            correctAnswer = currentQuestion.Answer
            
        
        } else {
            
            // Do something at finish - load a New Game question, repopulate array, setQuestion() again
            print("No more questions")
        
        }
        
    }
    
    func checkAnswer(sender: UIButton) {
        
        // I am having problems with scope. Can't add things like setting up the AudioServicesCreateSystemSoundID outside a function. Can't put it in viewDidLoad because I can't reach it from checkAnswer function. So have to put it here which means I am creating it every time I call this function
        
        let soundUrl = NSBundle.mainBundle().URLForResource("xylophone_affirm1", withExtension: "wav")
        
        var mySound: SystemSoundID = 0
        
        if soundUrl != nil {
        
            AudioServicesCreateSystemSoundID(soundUrl!, &mySound)
            
        }
        
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
        
    }
    
    
    
    func backToMenu() {
    
        navigationController?.popToRootViewControllerAnimated(true)
    
    }
    
}

// Refactor sounds with a Class:

/*
 
 
 
 With a class & AudioToolbox:
 
 import AudioToolbox
 
 class Sound {
 
 var soundEffect: SystemSoundID = 0
 init(name: String, type: String) {
 let path  = NSBundle.mainBundle().pathForResource(name, ofType: type)!
 let pathURL = NSURL(fileURLWithPath: path)
 AudioServicesCreateSystemSoundID(pathURL as CFURLRef, &soundEffect)
 }
 
 func play() {
 AudioServicesPlaySystemSound(soundEffect)
 }
 }
 
 Usage:
 
 testSound = Sound(name: "test", type: "caf")
 testSound.play()
 

 
 */

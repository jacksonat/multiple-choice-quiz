//
//  Configuration.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 21/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

import Foundation

var helloWorld = "Hello World"

// create an array of dictionaries, with strings as keys and any object as values

// Old code using plist commented out
//var multipleChoiceArray: Array<[String: AnyObject]>?

// Hard code the questions list here as a struct

struct Question {
    
    var Question: String?
    var Answers: [String]?
    var Answer: String // Could also be Int if the correct check is to the button array index
    
}

var QuestionsList = [
    
    Question(Question: "What is the capital of the U.K?", Answers: ["London", "Berlin", "New York", "Heathrow"], Answer: "London"),
    Question(Question: "What is the capital of the United States?", Answers: ["New York", "Los Angeles", "Seattle", "Washington D.C."], Answer: "Washinton D.C."),
    Question(Question: "What is the capital of France?", Answers: ["Paris", "Nice", "Lyon", "Marseilles"], Answer: "Paris"),
    Question(Question: "What is the capital of Germany", Answers: ["Frankfurt", "Berlin", "Bonn", "Strasburg"], Answer: "")

]







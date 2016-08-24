//
//  Configuration.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 21/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

import Foundation

// Hard code the questions list here as a struct

struct Question {
    
    var Question: String?
    var Answers: [String]?
    var Answer: Int // Could also be Int if the correct check is to the button array index
    
}

var QuestionsList = [
    
    Question(Question: "What is the capital of the U.K?", Answers: ["London", "Berlin", "New York", "Heathrow"], Answer: 0),
    Question(Question: "What is the capital of the United States?", Answers: ["New York", "Los Angeles", "Seattle", "Washington D.C."], Answer: 3),
    Question(Question: "What is the capital of France?", Answers: ["Paris", "Nice", "Lyon", "Marseilles"], Answer: 0),
    Question(Question: "What is the capital of Germany", Answers: ["Frankfurt", "Berlin", "Bonn", "Strasburg"], Answer: 1),
    Question(Question: "What is the capital of Austria", Answers: ["Salzburg", "Graz", "Vienna", "Linz"], Answer: 2),
    Question(Question: "What is the capital of Italy", Answers: ["Venice", "Rome", "Florence", "Positano"], Answer: 1),
    Question(Question: "What is the capital of Spain", Answers: ["Barclona", "Sienna", "Bonn", "Madrid"], Answer: 3)

]







//
//  Extensions.swift
//  Multiple Choice Quiz
//
//  Created by Jackson Taylor on 25/08/2016.
//  Copyright © 2016 Jackson Taylor. All rights reserved.
//

import Foundation

extension Array {

    mutating func shuffle() {
    
        if count < 2 { return }
        
        for i in 0 ..< (count - 1) {
        
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            
            swap(&self[i], &self[j])
        
        }
    
    }

}

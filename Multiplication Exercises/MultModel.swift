//
//  MultModel.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/3/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import Foundation

enum State {
    case problems, reset
}


struct MultModel {
    private let problems = 5
    private let maximumNumber = 15
    var multiplicand = Int.random(in: 0..<16)
    var multiplier = Int.random(in: 0..<16)

    var answer : Int {multiplicand*multiplier}
    var problemNumber : Int {currentCount + 1}
    var wrongAnswer1 = 1
//    lazy var wrongAnswer2 = abs((self.answer+Int.random(in: -5..<6)))
//    lazy var wrongAnswer3 = abs((self.answer+Int.random(in: -5..<6)))
    
    
    var state : State {

        if currentCount == (problems - 1) {
            return .reset
        }else {
            return .problems
        }
    }
    
    
    
    
    
    var buttonText : String {
        switch state {
        case .problems:
            return "Next Question"
        case .reset:
            return "Reset"
           }
    }
    
    mutating func generateProblemNumbers() -> (multiplicand:Int, multiplier:Int){
        let multiplicand = Int.random(in: 0..<16)
        let multiplier = Int.random(in: 0..<16)
        return (multiplicand, multiplier)
    }
    
    private var currentCount = 0
    
    
    mutating func incrementQuestion(){
        currentCount = (currentCount + 1) % problems
        (multiplicand, multiplier) = generateProblemNumbers()
    }
    
}

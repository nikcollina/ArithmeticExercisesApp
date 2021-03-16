//
//  NewProblemModel.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/8/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import Foundation

struct ProblemNumbers {
    var num1 : Int
    var num2 : Int
    var ans : Int {num1*num2}
    
    mutating func genWrong(ans: Int) -> ([Int]){
        let correctIndex = Int.random(in: 0..<ProblemConstants.numberOfAnswers)
        var answers = [Int]()
        var wrongAnswer = abs(ans + random())
        for _ in 0..<ProblemConstants.numberOfAnswers-1 {
            while (answers.contains(wrongAnswer) || (wrongAnswer == ans) || (wrongAnswer == 0)) {
                wrongAnswer = abs(ans+random())
            }
            answers.append(wrongAnswer)
        }
        answers.insert(ans, at: correctIndex)
        answers.append(correctIndex)
        return answers
    }
    
    mutating func random() -> Int {
        let randomNumber = Int.random(in: -ProblemConstants.wrongAnswerTolerance..<ProblemConstants.wrongAnswerTolerance+1)
        return randomNumber
    }
    
    
}

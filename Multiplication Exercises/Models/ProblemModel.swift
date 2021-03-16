//
//  MultModel.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/3/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import Foundation


enum GameState {
    case guess, result, reset
}
enum Difficulty : String, CaseIterable {
    case Easy, Medium, Hard
    
}
enum GameType : String, CaseIterable {
    case Addition, Multiplication
}

var problemNumbers = ProblemNumbers(num1:Int.random(in: ProblemConstants.multEasyMin..<ProblemConstants.multEasyMax+1), num2:Int.random(in: ProblemConstants.multEasyMin..<ProblemConstants.multEasyMax+1))

struct ProblemModel {
    var num1 = problemNumbers.num1
    var num2 = problemNumbers.num2
    var answer = problemNumbers.ans
    var allAnswers = problemNumbers.genWrong(ans: problemNumbers.ans)
    var currentProblemNumber = 0
    var correctAnswers = 0
    var gameState : GameState = .guess
    var problemResults : [Int]
    var difficulty : Difficulty {
        didSet {
            resetGame()
        }
    }
    var gameType : GameType {
        didSet {
            resetGame()
        }
    }
    var numberOfQuestions : Int {
        didSet {
            resetGame()
        }
    }
    init(count : Int, level : Difficulty, type : GameType){
        numberOfQuestions = count
        problemResults = Array(repeating: 0, count: numberOfQuestions)
        difficulty = level
        gameType = type
        
    }
    
    var buttonText : String {
        switch gameState {
        case .guess:
            return "Next Question"
        case .result:
            return "Next Question"
        case .reset:
            return "Reset"
        }
    }
    
    var difficultyText : String {
        switch difficulty {
        case .Easy:
            return "Easy"
        case .Medium:
            return "Medium"
        case .Hard:
            return "Hard"
        }
    }
    
    var gameTypeText : String {
        switch gameType {
        case .Addition:
            return "Addition"
            
        case .Multiplication:
            return "Multiplication"
        }
    }
    
    mutating func userAnswer(guess: Int) {
        if guess == allAnswers[ProblemConstants.numberOfAnswers]{
            correct(index: guess)
            advanceGameState()
        }
        else{
            incorrect(index: guess)
            advanceGameState()
        }
    }
    
    mutating func correct(index:Int){
        problemResults[currentProblemNumber] = (1)
        correctAnswers += 1
    }
    
    mutating func incorrect(index:Int){
        problemResults[currentProblemNumber] = (2)
    }
    
    mutating func advanceGameState()  {
        switch gameState {
            
        case .guess:
            if currentProblemNumber == (numberOfQuestions-1) {
                gameState = .reset
            }
            else {
                gameState = .result
            }
            
        case .result:
            gameState = .guess
            currentProblemNumber = (currentProblemNumber + 1) % (numberOfQuestions)
            (num1, num2 , answer, allAnswers) = generateProblemNumbers()
            
        case .reset:
            gameState = .guess
            currentProblemNumber = (currentProblemNumber + 1) % (numberOfQuestions)
            (num1, num2 , answer, allAnswers) = generateProblemNumbers()
            problemResults = Array(repeating: 0, count: numberOfQuestions)
            correctAnswers = 0
        }
    }
    
    mutating func resetGame() {
        (num1, num2 , answer, allAnswers) = generateProblemNumbers()
        problemResults = Array(repeating: 0, count: numberOfQuestions)
        correctAnswers = 0
        currentProblemNumber = 0
        gameState = .guess
    }
    
    mutating func generateProblemNumbers() -> (multiplicand:Int, multiplier:Int, answer: Int, allAnswers: [Int]){
        let num1 = randNum()
        let num2 = randNum()
        var answer : Int
        switch gameType {
        case .Multiplication:
            answer = num1*num2
        case .Addition:
            answer = num1+num2
        }
        let allAnswers = problemNumbers.genWrong(ans: answer)
        return (num1, num2, answer, allAnswers)
    }
    
    func randNum() -> Int {
        var num : Int
        switch gameType {
        case .Multiplication:
            switch difficulty {
            case .Easy:
                num = Int.random(in: ProblemConstants.multEasyMin..<ProblemConstants.multEasyMax + 1)
            case .Medium:
                num = Int.random(in: ProblemConstants.multMediumMin..<ProblemConstants.multMediumMax + 1)
            case .Hard:
                num = Int.random(in: ProblemConstants.multHardMin..<ProblemConstants.multHardMax + 1)
            }
        case .Addition:
            switch difficulty {
            case .Easy:
                num = Int.random(in: ProblemConstants.addEasyMin..<ProblemConstants.addEasyMax + 1)
            case .Medium:
                num = Int.random(in: ProblemConstants.addMediumMin..<ProblemConstants.addMediumMax + 1)
            case .Hard:
                num = Int.random(in: ProblemConstants.addHardMin..<ProblemConstants.addHardMax + 1)
            }
        }
        return num
    }
    
}

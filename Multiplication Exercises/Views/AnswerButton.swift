//
//  AnswerButton.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/3/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct AnswerButton: View {
    var buttonNumber:Int
    let index:Int
    @Binding var multModel : ProblemModel
    var shouldDisableAnswerButton : Bool {multModel.gameState != .guess}
    
    
    var body: some View {
        Button(action: {self.multModel.userAnswer(guess: self.index)}) {
            
            ZStack {
                RoundedRectangle(cornerRadius: ViewConstants.answerButtonCornerRadius)
                    .fill(ViewConstants.buttonColor)
                    .frame(width: ViewConstants.answerButtonSize, height: ViewConstants.answerButtonSize)
                if shouldDisableAnswerButton {
                    Text("\(buttonNumber)")
                        .font(ViewConstants.answerButtonFont)
                        .foregroundColor(index == multModel.allAnswers[ProblemConstants.numberOfAnswers] ? ViewConstants.correctAnswer : ViewConstants.incorrectAnswer)
                }
                else {
                    Text("\(buttonNumber)")
                        .font(ViewConstants.answerButtonFont)
                        .foregroundColor(ViewConstants.answerButtonText)
                }
            }
        }.disabled(shouldDisableAnswerButton)
    }
    
    
    
    
    
}

struct AnswerButton_Previews: PreviewProvider {
    @State static var multModel = ProblemModel(count: 5, level: .Easy, type: .Multiplication)
    static var previews: some View {
        AnswerButton(buttonNumber: 0, index: 0, multModel: $multModel)
    }
}

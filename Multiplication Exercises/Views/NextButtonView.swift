//
//  NextView.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/3/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct NextButtonView: View {
    //    @EnvironmentObject var multViewModel: MultViewModel
    @Binding var multModel : ProblemModel
    
    let buttonText : String
    let gameState : GameState
    
    var shouldDisableNextButton : Bool {gameState == .guess}
    
    
    var body: some View {
        Button (action: { self.multModel.advanceGameState() }) {
            ZStack{
                RoundedRectangle(cornerRadius: ViewConstants.otherButtonCornerRadius)
                    .fill(ViewConstants.buttonColor)
                    .frame(width: ViewConstants.nextButtonWidth, height: ViewConstants.nextButtonHeight)
                
                Text(buttonText)
                    .font(ViewConstants.otherButtonFont)
            }
        }.disabled(shouldDisableNextButton)
            .opacity(shouldDisableNextButton ? 0.0 : 1.0)
    }
    
    
}

struct NextView_Previews: PreviewProvider {
    @State static var multModel = ProblemModel(count: 5, level: .Easy, type: .Multiplication)
    static var previews: some View {
        NextButtonView(multModel: $multModel, buttonText: multModel.buttonText, gameState: .result)
    }
}

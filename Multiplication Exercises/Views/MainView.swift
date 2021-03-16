//
//  ContentView.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 8/29/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(ViewConstants.menuBackgroundColor)
                    .edgesIgnoringSafeArea(.all)
                VStack (alignment: .center, spacing: ViewConstants.menuSpacing) {
                    Text("Swift Multiplication")
                        .foregroundColor(ViewConstants.whiteFontColor)
                        .font(ViewConstants.titleFont)
                    
                    Image("timesTables")
                    
                    
                    NavigationLink(destination: MultRootView()) {
                        Text("Start")
                            .foregroundColor(ViewConstants.startButtonTextColor)
                            .font(ViewConstants.otherButtonFont)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: ViewConstants.otherButtonCornerRadius).fill(ViewConstants.startButtonColor))
                    }
                    
                    
                }
                
            }
            
        }
    }
    
    
    
    struct MultRootView: View {
        
        @State private var problemModel = ProblemModel(count: 5, level: .Easy, type: .Multiplication)
        
        var body: some View{
            ZStack {
                Rectangle()
                    .fill(ViewConstants.gameBackgroundColor)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    
                    PreferencesButtonView(multModel: $problemModel, difficultyText: problemModel.difficultyText, typeText: problemModel.gameTypeText)
                    
                    ProgressView(results: problemModel.problemResults, correctAnswers: problemModel.correctAnswers, questionsPerRound: problemModel.numberOfQuestions).padding()
                    
                    ProblemView(problemNumber: problemModel.currentProblemNumber, multiplicand: problemModel.num1, multiplier: problemModel.num2, gameType: problemModel.gameType).padding()
                    
                    AnswerView( multModel: $problemModel).padding()
                    
                    NextButtonView(multModel: $problemModel, buttonText: problemModel.buttonText, gameState: problemModel.gameState).padding()
                    
                }
            }
                
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


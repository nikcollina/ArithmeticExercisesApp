//
//  ViewConstants.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/9/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct ViewConstants {
    static let menuBackgroundColor = Color.red.opacity(0.70)
    static let gameBackgroundColor = Color.blue.opacity(0.70)
    static let buttonColor = Color.white.opacity(0.50)
    static let progressColor = Color.gray.opacity(0.50)
    static let startButtonTextColor = Color.blue
    static let startButtonColor = Color.white
    
    static let correctAnswer = Color.green
    static let incorrectAnswer = Color.red
    static let answerButtonText = Color.black
    static let whiteFontColor = Color.white
    
    static let answerButtonSize: CGFloat = 40.0
    static let answerButtonCornerRadius: CGFloat = 5.0
    static let otherButtonCornerRadius: CGFloat = 20.0
    static let nextButtonHeight: CGFloat = 50.0
    static let nextButtonWidth: CGFloat = 300.0
    static let progressCircleSize: CGFloat = 40.0
    static let menuSpacing: CGFloat = 50.0
    static let equalBarHeight: CGFloat = 8.0
    static let equalBarLength: CGFloat = 100.0
    static let settingsButtonSize: CGFloat = 25.0
        
    static let titleFont = Font.system(size: 50, weight: .bold, design: .rounded)
    static let currentPreferencesFont = Font.system(size: 25, weight: .bold, design: .rounded)
    static let otherButtonFont = Font.system(size: 25, weight: .bold, design: .rounded)
    static let problemNumberFont = Font.system(size: 50, weight: .black, design: .rounded)
    static let progressFont = Font.system(size: 20, weight:.bold, design: .rounded)
    static let answerButtonFont = Font.system(size: 15, weight:.bold, design: .rounded)
    static let otherFont = Font.system(size: 15, weight: .bold, design: .rounded)
    
}

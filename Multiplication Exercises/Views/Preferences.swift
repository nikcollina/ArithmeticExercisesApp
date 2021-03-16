//
//  Preferences.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/16/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct Preferences: View {
    @Binding var isShowingPreferences : Bool
    @Binding var multModel : ProblemModel
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Number of Questions")) {
                    Stepper(value: $multModel.numberOfQuestions, in: 3...7) {
                        Text("\(multModel.numberOfQuestions)")
                            .font(ViewConstants.otherFont)
                    }
                }
                
                Section(header: Text("Difficulty")) {
                    Picker("Difficulty", selection: $multModel.difficulty){
                        ForEach(Difficulty.allCases, id:\.self) { value in
                            Text("\(value.rawValue)")
                                .font(ViewConstants.otherFont)
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Type")) {
                    Picker("Type", selection: $multModel.gameType){
                        ForEach(GameType.allCases, id:\.self) { value in
                            Text("\(value.rawValue)")
                                .font(ViewConstants.otherFont)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section() {
                    HStack {
                        Spacer()
                        Button("Dismiss") { self.isShowingPreferences.toggle() }
                        Spacer()
                    }
                }.navigationBarTitle("Preferences")
                
            }
        }
        
    }
}

struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

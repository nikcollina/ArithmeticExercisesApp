//
//  PreferencesButtonView.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/16/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PreferencesButtonView: View {
    
    @State private  var isShowingPreference = false
    @Binding var multModel : ProblemModel
    var difficultyText : String
    var typeText : String
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("\(typeText) Challenge")
                Text("Difficulty: \(difficultyText)")
            }.font(ViewConstants.currentPreferencesFont)
            Spacer()
            Button(action: { self.isShowingPreference.toggle() }) {
                Image(systemName: "gear")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ViewConstants.settingsButtonSize, height: ViewConstants.settingsButtonSize, alignment: .center)
                    .foregroundColor(ViewConstants.buttonColor)
            }.sheet(isPresented: $isShowingPreference) {
                Preferences(isShowingPreferences: self.$isShowingPreference, multModel: self.$multModel)
                
            }
            
        }.padding()
    }
}


struct PreferencesButtonView_Previews: PreviewProvider {
    @State static var multModel = ProblemModel(count: 5, level: .Easy, type: .Multiplication)
    static var previews: some View {
        PreferencesButtonView(multModel: $multModel, difficultyText: "Easy", typeText: "Multiplication")
    }
}

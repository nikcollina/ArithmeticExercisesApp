//
//  AnswerView.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/3/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct AnswerView: View {
    
    @Binding var multModel : ProblemModel
    
    
    
    var body: some View {
        
        
        HStack {
            ForEach(0..<ProblemConstants.numberOfAnswers) { i in
                AnswerButton(buttonNumber: self.multModel.allAnswers[i], index: i, multModel: self.$multModel)
            }
            
        }
    }
}

struct AnswerView_Previews: PreviewProvider {
    @State static var problemModel = ProblemModel(count: 5, level: .Easy, type: .Multiplication)
    static var previews: some View {
        AnswerView(multModel: $problemModel)
    }
}

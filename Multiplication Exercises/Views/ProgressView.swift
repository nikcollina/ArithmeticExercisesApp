//
//  ProgressView.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/3/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    static let symbols = ["", "✅", "❌"]
    let results : [Int]
    let correctAnswers : Int
    let questionsPerRound : Int
    var body: some View {
        VStack {
            HStack{
                ForEach(results.indices, id:\.self) {i in
                    ZStack {
                        
                        Circle()
                            .fill(ViewConstants.progressColor)
                            .frame(width: ViewConstants.progressCircleSize, height: ViewConstants.progressCircleSize)
                        //                        Text(self.results[i])
                        //                            .font(ViewConstants.progressFont)
                        Text(ProgressView.symbols[self.results[i]])
                        
                    }
                    
                }
            }
            Text("\(correctAnswers)/\(questionsPerRound)")
                .font(ViewConstants.progressFont)
            
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(results: [0, 1], correctAnswers: 2, questionsPerRound: 5)
    }
}

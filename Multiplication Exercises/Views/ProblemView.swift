//
//  ProblemView.swift
//  Multiplication Exercises
//
//  Created by Nikolas Collina on 9/3/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct ProblemView: View {
    //    @EnvironmentObject var multViewModel: MultViewModel
    
    
    let problemNumber : Int
    let multiplicand : Int
    let multiplier : Int
    var gameType : GameType
    
    var body: some View {
        VStack (alignment: .center) {
            Text("Problem \(problemNumber+1)")
                .font(ViewConstants.titleFont)
                .padding()
            Group{
                HStack (alignment: .bottom) {
                    Text(gameType == .Multiplication ? "x" : "+")
                        .font(ViewConstants.problemNumberFont)
                    
                    VStack (alignment: .center) {
                        
                        Text("\(multiplicand)")
                        
                        Text("\(multiplier)")
                        
                    }.font(ViewConstants.problemNumberFont)
                    
                }
            }.font(.largeTitle)
            Rectangle()
                .frame(width: ViewConstants.equalBarLength, height: ViewConstants.equalBarHeight)
        }
    }
}
struct ProblemView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemView(problemNumber: 1, multiplicand: 2, multiplier: 2, gameType: .Multiplication)
    }
}

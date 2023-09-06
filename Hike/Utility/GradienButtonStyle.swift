//
//  GradienButtonStyle.swift
//  Hike
//
//  Created by Nindya Alita Rosalia on 12/08/23.
//

import Foundation
import SwiftUI

struct GradienButton : ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            // button background
            .background(
                
                configuration.isPressed ?
                
                //when user pressed the button
                LinearGradient(
                    colors: [.customGrayMedium, .customGrayLight],
                    startPoint: .top,
                    endPoint: .bottom)
                :
                //when the button is not pressed
                LinearGradient(
                    colors: [.customGrayLight, .customGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom)
            ).cornerRadius(40)
    }
}

//
//  CustomCircleView.swift
//  Hike
//
//  Created by Nindya Alita Rosalia on 12/08/23.
//

import SwiftUI

struct CustomCircleView: View {
    
    //new variable that can turn on the animation
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.customIndigoMedium, .customSalmonLight ],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
                    )
                )
                //animations will play if this screen is show
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses : true)){
                        isAnimateGradient.toggle() // switch isAnimateGradien from false to true
                    }
                }
            
            MotionAnimationView()
            
        }//: ZSTACK
        .frame(width: 256, height: 256)
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}

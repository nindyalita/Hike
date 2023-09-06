//
//  CardView.swift
//  Hike
//
//  Created by Nindya Alita Rosalia on 09/08/23.
//

import SwiftUI

struct CardView: View {
    
    // MARK: PROPERTIES
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: FUNCTION
    // ketika randomNumber bernilai sama dengan imageNumber yang sedang tampil
    // maka akan dilakukan pengacakan nilai dari randomImage
    // sehingga gambar akan terus berganti
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        
        ZStack {
            CustomBackgroundView()
    
            VStack {
                
                // MARK: - HEADER
                
                VStack (alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight, .customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                        )
                        
                        Spacer() 
                        
                        Button{
                            
                            //Action : Show Sheet
                            
                            print("button pressed")
                            isShowingSheet.toggle()
                            
                        }label: {
                            CustomButtonView()
                        }
                        //making seet
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible) // show drag sheet to down
                                .presentationDetents([.medium, .large]) //size of sheet
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and family")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayLight)
                    
                }// : HEADER
                .padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT
                
                
                ZStack {
                    
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber) // value = trigger kapan animasi akan berganti, maka animasi akan berganti jika imageNumber berganti
                    
                }
                
                // MARK: - FOOTER
                Button{
                    //action
                    print("button was pressed...")
                    randomImage()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight, .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom ))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradienButton())
                
                
            }
        }
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

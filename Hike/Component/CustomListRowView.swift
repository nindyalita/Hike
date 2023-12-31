//
//  CustomListRowView.swift
//  Hike
//
//  Created by Nindya Alita Rosalia on 13/08/23.
//

import SwiftUI

struct CustomListRowView: View {
    
    //MARK: PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        
        LabeledContent{
            //content
            if rowContent != nil {
                Text(rowContent!) // if we want to use default value we need to put "!"
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }else if (rowLinkLabel != nil && rowLinkDestination != nil){
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }label: {
            //label
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                }
                Text(rowLabel)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List() {
            CustomListRowView(
                rowLabel: "Website",
                rowIcon: "globe",
                rowContent: nil,
                rowTintColor: .pink,
                rowLinkLabel: "CredoAcademy",
                rowLinkDestination: "https:/credo.academy"
            )
        }
    }
}

//
//  HeadingView.swift
//  Parking
//
//  Created by stdc user on 02/03/2023.
//

import SwiftUI

struct HeadingView: View {
    @State private var isShowingProfile = false
    var body: some View {
        HStack (spacing: 30) {
           
                Image("logo")
                    .aspectRatio(contentMode: .fit)
            
            VStack {
                Text("Ahmad's Profile")
                    .shadow(color: Color.gray, radius: 2, x: 3, y: 2)
                    .font(.custom("Futura", size: 20))
                    .bold()
                    .foregroundColor(Color("purple"))
                Text(Date().formatted())
                    .foregroundColor(Color("red"))
                    .font(.custom("Futura", size: 15))
                
            }
            Image(systemName: "person.circle")
                .font(.system(size: 50))
                .foregroundColor(.gray)
                .onTapGesture {
                    isShowingProfile = true
                }
           
            
            
        }.padding(.leading, 5)
        Spacer()
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView()
    }
}

//
//  OthersView.swift
//  Parking
//
//  Created by stdc user on 02/03/2023.
//

import SwiftUI

struct OthersView: View {
    var body: some View {
//        NavigationView {
            VStack {
                HeadingView()
                Text("Others")
    //                .shadow(color: Color.gray, radius: 2, x: 3, y: 2)
                    .font(.custom("Futura", size: 25))
                    .bold()
                    .foregroundColor(Color("lightblue"))
                
                
                VStack(spacing: 30) {
                    BadgesButton(buttonText: "Perpustakaan", badgesText: "1", carPark: "Perpustakaan")
                    BadgesButton(buttonText: "Tasik", badgesText: "5", carPark: "Tasik")
                    BadgesButton(buttonText: "Padang Kawad", badgesText: "1", carPark: "Padang Kawad")
                    BadgesButton(buttonText: "Dewan Tuanku Canselor", badgesText: "2", carPark: "Dewan Tuanku Canselor")
                    BadgesButton(buttonText: "Gelanggang Bola Baling", badgesText: "4", carPark: "Gelanggang Bola Baling")
                    BadgesButton(buttonText: "Gelanggang Badminton", badgesText: "1", carPark: "Gelanggang Badminton")
                    Spacer()
                }.padding(.horizontal,20)
            }
//        }
    }
}

struct OthersView_Previews: PreviewProvider {
    static var previews: some View {
        OthersView()
    }
}

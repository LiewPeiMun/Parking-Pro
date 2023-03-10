//
//  BadgesButton.swift
//  Parking
//
//  Created by stdc user on 02/03/2023.
//

import SwiftUI
import AudioToolbox

struct BadgesButton: View {
    var buttonText: String
    var badgesText: String
    var carPark: String
    
    var body: some View {
        NavigationLink(destination: CarPark(parkingName: carPark)) {
            Text(buttonText)
                .font(.custom("Graphik", size: 20))
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("yellow"))
                .foregroundColor(.black)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 3, x: 0, y: 5)
            
                .overlay(
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("purple"))
                        .overlay(
                            Text(badgesText)
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                        )
                        .offset(x: -10, y: 0),
                    alignment: .trailing
                )
                
        }
    }
}

struct BadgesButton_Previews: PreviewProvider {
    static var previews: some View {
        BadgesButton(buttonText: "", badgesText: "", carPark: "Kolej Mawar")
    }
}

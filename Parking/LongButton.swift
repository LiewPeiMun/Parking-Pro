//
//  LongButton.swift
//  Parking
//
//  Created by stdc user on 02/03/2023.
//

import SwiftUI
import AudioToolbox

struct LongButton: View {
    var buttonText: String
    
    var body: some View {
        NavigationView {
            Button(action: {
                // Action for button 1
//                NavigationLink(""){ FacultyView()}
                AudioServicesPlaySystemSound(1100) // Plays the system sound
            }, label: {
                Text(buttonText)
                    .font(.custom("Graphik", size: 20))
                    .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("yellow"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 3, x: 0, y: 5)
                    
        })
        }
    }
}

struct LongButton_Previews: PreviewProvider {
    static var previews: some View {
        LongButton(buttonText: "")
    }
}

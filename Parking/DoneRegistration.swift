//
//  TestingExtend.swift
//  Parking
//
//  Created by stdc user on 03/03/2023.
//

import SwiftUI
import AudioToolbox

struct DoneRegistration: View {
    var body: some View {
        VStack {
            Image("logoBig")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250) // Increase the height of the image
                .padding(.top, 20)
            
            VStack {
                Text("Congratulation!")
                    .font(.title)
                
                Text("Your account has been")
                    .font(.title)
                
                Text("successfully created!")
                    .font(.title)
            
                
                VStack {
                    NavigationLink (destination: Login()) {
//                    Button(action: {AudioServicesPlaySystemSound(1100)}) {
                        
                        Text("Login now      ")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                    }
                }
            }
            .padding(35)
            .background(Color("grey"))
            .cornerRadius(10)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                
                   Spacer()
               }
               .edgesIgnoringSafeArea(.top)
    }
}

struct DoneRegistration_Previews: PreviewProvider {
    static var previews: some View {
        DoneRegistration()
    }
}

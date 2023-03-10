//
//  TestingExtend.swift
//  Parking
//
//  Created by stdc user on 03/03/2023.
//

import SwiftUI
import AudioToolbox

struct ExtendTimeSuccess: View {
    
    @Binding var closeSheet: Bool
    
    var body: some View {
        VStack {
                   Image("logoBig")
                .resizable()
                .aspectRatio(contentMode: .fit)
                       .frame(height: 250) // Increase the height of the image
                       .padding(.top, 20)
            
            VStack(spacing: 40) {
                VStack {
                    Text("Extend time")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    
                    Text("SUCCESS!")
                        .font(.title)
                        .foregroundColor(.green)
                }
                VStack {
                    Button(action:  {AudioServicesPlaySystemSound(1100)
                        closeSheet = false
                    }){
                        Text("OKAY")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                    }
                }
            }
                        .padding(70)
                        .background(Color("grey"))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                   Spacer()
               }
               .edgesIgnoringSafeArea(.top)
    }
}

struct ExtendTimeSucess_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExtendTimeSuccess(closeSheet: .constant(false))
        }
    }
}

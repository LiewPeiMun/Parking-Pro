//
//  LeaveNow.swift
//  Parking
//
//  Created by stdc user on 03/03/2023.
//

import SwiftUI
import AudioToolbox

struct NotiForDoubleParkUser: View {
    
    var body: some View {
        VStack {
            HeadingView()
            VStack(spacing: 40) {
                VStack{
                    Text("Someone is leaving,")
                        .font(.title)
                    Text("please remove your")
                        .font(.title)
                    Text("car in 10 minutes.")
                        .font(.title)
                    Text("Thank you")
                        .font(.title)
                }
                .padding(30)
                .foregroundColor(.white)
                .background(Color("lightblue"))
                VStack {
                    Button(action: {AudioServicesPlaySystemSound(1100)}){
                        Text("OKAY    ")
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
                    .background(Color.red)
                    .border(Color.gray, width: 3)
                    .cornerRadius(5)
            
            VStack {
                Text("After 10 minutes your number")
                Text("will be shown to the other user.")
            }
            .bold()
            Spacer()
        }
        
    }
}

struct NotiForDoubleParkUser_Previews: PreviewProvider {
    static var previews: some View {
        NotiForDoubleParkUser()
    }
}

//
//  EnterDurationPark.swift
//  ChatGPTapps
//
//  Created by stdc user on 04/03/2023.
//

import SwiftUI
import AudioToolbox

struct EnterDurationPark: View {
    @State var parkingLotCode: String = "FE01"
    @State private var is30 = false
    @State private var is1 = false
    @State private var is2 = false
    @State private var is3 = false
    @State private var is5 = false
    @State private var is8 = false
    
    @State var selection: [String] = ["00","00"]
    
    var body: some View {
        VStack {
            HeadingView()
            Text("Kolej Mawar")
                .font(.custom("Futura", size: 25))
                .bold()
                .foregroundColor(.black)
            HStack(spacing: 10 ) {
                VStack {
                    Text("Park")
                    Text("Lot No:")
                }
                .padding(.horizontal, 40)
                .font(.system(size: 25))
                TextField("Enter parking lot code", text: $parkingLotCode)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color("grey"))
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                    .font(.system(size: 25))
            }
            .padding()
        
            Text("Duration:")
                .foregroundColor(Color("orange"))
                            .font(.system(size: 35))
                            .bold()
                            .padding(.top, 20)
            
            Duration(selection: $selection)
            Text("Reminder: Please release your handbreak")
                        Text("if you double park.")
//            HStack(spacing: 50) {
//                Button(action: {}) {
//                    Text("Cancel")
//                        .foregroundColor(Color.white)
//                        .padding()
//                        .background(Color("red"))
//                        .cornerRadius(10)
//                        .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
//                }
                NavigationLink(destination: viewtime(parkingTime: "\(selection[0])\(selection[1])", parkingLot: "")) {
                    Text("Add      ")
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color("cyan"))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                }
//            }
            Spacer()
        }
    }
}

struct EnterDurationPark_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EnterDurationPark()
        }
    }
}

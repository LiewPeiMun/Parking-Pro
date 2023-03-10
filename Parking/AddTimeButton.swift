//
//  AddTimeButton.swift
//  Parking
//
//  Created by stdc user on 07/03/2023.
//

import SwiftUI
import AudioToolbox

struct AddTimeButton: View {
    
    @Binding var configButton: ConfigButton
//    var number: Int
//    var text: String
//    @State private var isActive = false // declare isActive as a mutable variable
    var number: Int {
        if configButton.hours==0 {
            return configButton.mins
        } else {
            return configButton.hours
        }
    }
    var text: String {
        if configButton.hours==0 {
            return "minutes"
        } else {
            return "hours"
        }
    }
    
    var body: some View {
        //var isActive = false
        Button(action: {
            AudioServicesPlaySystemSound(1100)
            configButton.selected.toggle()
        }) {
            VStack {
                Text("\(number)")
                Text(text)
            }
            .padding()
            .background(configButton.selected ? Color("lightblue") : Color("grey"))
            .cornerRadius(10)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
        }
    }
}

struct AddTimeButton_Previews: PreviewProvider {
    static var previews: some View {
        AddTimeButton(configButton: .constant(ConfigButton(hours: 1, mins: 0)))
    }
}

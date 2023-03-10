//
//  viewtime.swift
//  addtime
//
//  Created by stdc user on 03/03/2023.
//

import SwiftUI
import AudioToolbox

struct ConfigButton: Identifiable{
    var id = UUID()
    var hours = 0
    var mins = 0
    
    var selected = false
}

struct viewtime: View {
    
    @State private var ExtendSuccessful = false
    @State private var TryingToLeave = false
    
    @State var parkingTime = ""
    @State var parkingLot = ""
    @State private var is30 = false
    @State private var is1 = false
    @State private var is2 = false
    @State private var is3 = false
    @State private var is5 = false
    @State private var is8 = false
    
    
    
    @State var configButtons = [
    ConfigButton(hours: 0, mins: 30),
    ConfigButton(hours: 1, mins: 0),
    ConfigButton(hours: 2, mins: 0),
    ConfigButton(hours: 3, mins: 0),
    ConfigButton(hours: 5, mins: 0),
    ConfigButton(hours: 8, mins: 0)
    ]
    
    
//    var parkingName: String
    
    
    
    let config = [
            GridItem(.adaptive(minimum: 100))
        ]
    var body: some View {
        VStack {
            HeadingView()
            
            VStack{
                
                Text("Kolej Mawar")
                    .font(.custom("Futura", size: 25))
                    .bold()
                    .foregroundColor(.black)
                    .padding(.top, 100)
                
                HStack (spacing:30){
                    Text("TIME LEFT")
                    Text(":")
                    Text(parkingTime)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color("grey"))
                        .cornerRadius(10)
                }
                
                HStack (spacing:25){
                    
                    Text("PARK LOT NO")
                    Text (":")
                    TextField("FE01", text:$parkingLot, prompt:
                                Text("KM2A").foregroundColor(.black))
                        .padding()
                        .foregroundColor(.black)
                        .background(Color("grey"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                }.padding(.leading, 45)
                    .padding(.trailing, 70)
                
                Text("Add Duration:")
                    .foregroundColor(Color("orange"))
                                .font(.system(size: 35))
                                .bold()
                                .padding(.top, 20)
                
                LazyVGrid(columns: config, spacing: 30) {
                    ForEach($configButtons) { button in
                        AddTimeButton(configButton: button)
                    }
                }
                                        
                
            }.padding(.horizontal, 10)
                .padding(.top, -600)
    
           
            HStack(spacing: 50) {
                Button {
                    
                    TryingToLeave.toggle()
                }
                label: {
                    Text("Leave")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color("red"))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                    }
                .sheet(isPresented: $TryingToLeave) {
                    ConfirmationLeaveView(wantCancelLeave: $TryingToLeave)
                }
                Button {
                    //                (action: {
                    //                    parkingTime = "\(hour) : \(min)"
                    var totalHours = 0
                    var totalMinutes = 0
                    
                    for configButton in configButtons {
                        if configButton.selected == true {
                            totalHours += configButton.hours
                            totalMinutes += configButton.mins
                        }
                    }
                    
                    let timeComponents = parkingTime.split(separator: ":")
                    var hoursInt = Int(timeComponents[0]) ?? 0
                    var minutesInt = Int(timeComponents[1]) ?? 0
                    
                    print("\(hoursInt):\(minutesInt)  \(totalHours)&\(totalMinutes)")
                    print(timeComponents)
                    
                    hoursInt+=totalHours
                    minutesInt+=totalMinutes
                    
                    
                    
                    if minutesInt >= 60 {
                        hoursInt += 1
                        minutesInt %= 60
                    }
                    
                    print("\(hoursInt):\(minutesInt)  \(totalHours)&\(totalMinutes)")
//                    var newTimeComponents: [String] = []
//                    newTimeComponents.append(String(format: "%02d", hoursInt))
//                    newTimeComponents.append(String(format: "%02d", minutesInt))
//                    var newParkingTime = newTimeComponents.joined(separator: ":")
                    parkingTime = "\(hoursInt):\(minutesInt)"
//                    parkingTime = newParkingTime
                   
                    ExtendSuccessful.toggle()
                    
                }
            label: {
                Text("Extend")
                    .foregroundColor(Color.black)
                    .padding()
                    .background(Color("cyan"))
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
            }
            .sheet(isPresented: $ExtendSuccessful) {
                ExtendTimeSuccess(closeSheet: $ExtendSuccessful)
                }
            }
//            .padding(.bottom, 80)
        }.padding()
        
    }
}
    struct viewtime_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                viewtime(parkingTime: "01:30", parkingLot: "KMA1")
            }
        }
    }

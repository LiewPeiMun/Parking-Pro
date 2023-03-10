//
//  CarPark.swift
//  Parking
//
//  Created by stdc user on 03/03/2023.
//

import SwiftUI

struct ParkingSpot: Identifiable {
    let id = UUID()
    let label: String
    //    var isOccupied: Bool = false
    var duration: Int
    
}

struct CarPark: View {
    let rows = 10
    let columns = 2
    let durations = [12, 30, 20, 0, 5, 98, 0, 14, 28, 12, 67, 200, 21, 0, 16, 0, 130, 26, 13, 11]
    
    var parkingSpots: [ParkingSpot] {
        (1...20).map { ParkingSpot(label: "KM\($0)", duration: durations[$0-1]) }
    }
    
    
    
    //    let parkingSpots = (1...20).map { ParkingSpot(label: "CM\($0)A", duration: 10) }
    
    let rows2 = 5
    let columns2 = 2
    let durations2 = [4, 0, 0, 24, 23, 8, 13, 0, 10, 30]
    var doubleParks: [ParkingSpot] {
        (1...10).map { ParkingSpot(label: "KM\($0)A", duration: durations2[$0-1]) }
    }
    
    
    var parkingName: String
    
    var body: some View {
//        NavigationView {
            VStack {
                HeadingView()
                Text(parkingName)
                    .font(.custom("Futura", size: 25))
                    .bold()
                    .foregroundColor(.black)
                
                VStack(spacing: 5) {
                    HStack {
                        HStack {
                            Rectangle()
                                .fill(Color("puregreen"))
                                .frame(width: 20, height: 20)
                            Text("Available")
                                .font(.system(size: 12))
                            Spacer()
                        }
                        HStack {
                            Rectangle()
                                .fill(Color("pureblue"))
                                .frame(width: 20, height: 20)
                            Text("1 - 10 mins")
                                .font(.system(size: 12))
                            Spacer()
                        }
                    }
                    
                    HStack {
//                        HStack {
//                            Rectangle()
//                                .fill(Color("pureyellow"))
//                                .frame(width: 20, height: 20)
//                            Text("21 - 30 mins")
//                                .font(.system(size: 12))
//                            Spacer()
//                        }
                        HStack {
                            
                            Rectangle()
                                .fill(Color("purered"))
                                .frame(width: 20, height: 20)
                            Text("more than 30 mins")
                                .font(.system(size: 12))
                            Spacer()
                        }
                        HStack {

                            Rectangle()
                                .fill(Color("puregrey"))
                                .frame(width: 20, height: 20)
                            Text("Not available")
                                .font(.system(size: 12))
                            Spacer()
                        }
                        
                    }
                    
                    HStack {
                        
                        Text("*Duration shown in hours")
                            .bold()
                            .font(.system(size: 12))
                            .padding(.leading, -180)
                        
//                        HStack{
//                            Text("**Duration shown = hh:mm")
//                                .font(.system(size: 12))
//                                .padding(.leading, -180)
//                        }
                        
                        
                    }.padding(.bottom, 10)
                        .padding(.top, 3)
                    
                }.padding(.horizontal)
                
                
                ZStack {

                    Color("lightgrey").ignoresSafeArea()
                    ScrollView {
                        
                        ZStack {
                            
                            VStack(spacing: -30){
                                
                                ForEach(0..<rows) { row in
                                    HStack(spacing: 187) {
                                        ForEach(0..<columns) { column in
                                            let index = row * columns + column
                                            ParkingSpotView(parkingSpot: parkingSpots[index])
                                        }
                                    }
                                }
                            }
                            VStack(spacing: 40){
                                ForEach(0..<rows2) { row2 in
                                    HStack(spacing:20) {
                                        ForEach(0..<columns2) { column2 in
                                            let index2 = row2 * columns2 + column2
                                            doubleParkView(doublePark: doubleParks[index2])
                                        }
                                    }
                                }
                            }
                            
                        }
                        
                    }.padding(.horizontal, 30)
                }
                
            }
//        }
    }
    
}


struct ParkingSpotView: View {
    var parkingSpot: ParkingSpot
    @State var duration: TimeInterval = 0
    @State var elapsedTime: TimeInterval
    var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var navigateToEnterDurationParkPage = false
    @State private var navigateToViewTimePage = false
    @State private var elapsedTimeIsZeroCount = 0
    
    @State private var inputDurationPark = false
    
    var color: Color {
        switch elapsedTime {
        case let a where a == 0:
            return Color("puregreen")
        case 1..<660:
            return Color("pureblue")
//        case 660..<1260:
//            return Color("pureblue")
//        case 1260..<1860:
//            return Color("pureyellow")
        case let b where b >= 660:
            return Color("purered")
        default:
            return Color.white
        }
    }
    
    init(parkingSpot: ParkingSpot) {
        self.parkingSpot = parkingSpot
        _elapsedTime = State(initialValue: TimeInterval(parkingSpot.duration * 60))
    }
    
    var body: some View {
        ZStack {
            VStack {
//                Text(parkingSpot.label)
//                    .foregroundColor(.black)
                
                if elapsedTime > 0 {
                    Text(timeString(from: Int(elapsedTime)))
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .padding(.all, 5)
                        .background(Color.black)
                }
            }
            
            Image(systemName: "car.side")
                        // replace with an image of a car
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(color)
                                        .frame(width: 100, height: 100)
                .overlay(
                    // Show a button overlay only when elapsed time is 0
                    Button(action: {
                        if elapsedTime == 0 {
                            navigateToEnterDurationParkPage = true
                            }
                        else{
                            navigateToViewTimePage = true
                        }
                    }, label: {
                        // You can customize the button appearance here
                        Text("         ")
                    }
                          )
                    
                    .padding(.horizontal, 1)
                    .padding(.vertical, 1)
                    .background(Color.clear)
                    .cornerRadius(5)
                    .frame(width: 90, height: 90)
                    .overlay(
                        navigateToEnterDurationParkPage ? NavigationLink(destination:AnyView(EnterDurationPark(parkingLotCode: parkingSpot.label)), isActive: $navigateToEnterDurationParkPage) {
                    EmptyView()
                    } : NavigationLink(destination:AnyView(viewtime(parkingTime:(
                        String(format: "%02d:%02d", Int(elapsedTime / 3600), Int((elapsedTime.truncatingRemainder(dividingBy: 3600)) / 60))), parkingLot: parkingSpot.label)), isActive: $navigateToViewTimePage){
                    EmptyView()
                    }
                    )
                )
            

            
            
        }.onReceive(timer) { _ in
            if elapsedTime > 0 {
                elapsedTime -= 1
                
            } else {
                timer.upstream.connect().cancel()
            }
            duration += 1
        }
        
    }
    
    
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let hours = minutes / 60
        let remainingMinutes = minutes % 60
        return String(format: "%02d:%02d", hours, remainingMinutes)
    }
    
}

struct doubleParkView: View {
    var doublePark: ParkingSpot
    @State var duration: TimeInterval = 0
    @State var elapsedTime: TimeInterval
    var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var navigateToEnterDurationParkPage = false
    @State private var navigateToViewTimePage = false
    
    var color: Color {
        switch elapsedTime {
        case let a where a == 0:
            return Color("puregreen")
        case 1..<660:
            return Color("pureblue")
//        case 660..<1260:
//            return Color("pureblue")
//        case 1260..<1860:
//            return Color("pureyellow")
        case let b where b >= 660:
            return Color("purered")
        default:
            return Color.white
        }
    }
    
    init(doublePark: ParkingSpot) {
        self.doublePark = doublePark
        _elapsedTime = State(initialValue: TimeInterval(doublePark.duration * 60))
    }
    
    var body: some View {
        
        ZStack {
            Image(systemName: "car.side")
                       // replace with an image of a car
                                       .resizable()
                                       .scaledToFit()
                                       .foregroundColor(color)
           //                            .mask(RoundedRectangle(cornerRadius: 8))
                                       .frame(width: 100, height: 100)
                                       .rotationEffect(.degrees(90))
                       
            
                .overlay(
                    // Show a button overlay only when elapsed time is 0
                    Button(action: {
                        if elapsedTime == 0 {
                            navigateToEnterDurationParkPage = true
                            }
                        else{
                            navigateToViewTimePage = true
                        }
                    }, label: {
                        // You can customize the button appearance here
                        Text("         ")
                    })
                    .frame(width: 50, height: 170)
                    .padding(.horizontal, 1)
                    .padding(.vertical, 1)
                    .background(Color.clear)
                    .cornerRadius(5)
//                    .opacity(elapsedTime == 0 ? 1 : 0) // Make the button visible only when elapsed time is 0
                    .overlay(
                        navigateToEnterDurationParkPage ? NavigationLink(destination:AnyView(EnterDurationPark(parkingLotCode: doublePark.label)), isActive: $navigateToEnterDurationParkPage) {
                    EmptyView()
                    } : NavigationLink(destination:AnyView(viewtime(parkingTime:(
                        String(format: "%02d:%02d", Int(elapsedTime / 3600), Int((elapsedTime.truncatingRemainder(dividingBy: 3600)) / 60))), parkingLot: doublePark.label)), isActive: $navigateToViewTimePage){
                    EmptyView()
                    }
                    )
                )
            
            VStack {
//                Text(parkingSpot2.label)
//                    .foregroundColor(.black)
//                    .font(.system(size: 13))
                
                if elapsedTime > 0 {
                    Text(timeString(from: Int(elapsedTime)))
                        .foregroundColor(.white)
                        .font(.system(size: 10))
                        .padding(.all, 5)
                        .background(Color.black)
                }
            }
            
            
        }.onReceive(timer) { _ in
            if elapsedTime > 0 {
                elapsedTime -= 1
                
            } else {
                timer.upstream.connect().cancel()
            }
            duration += 1
        }
    }
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let hours = minutes / 60
        let remainingMinutes = minutes % 60
        return String(format: "%02d:%02d", hours, remainingMinutes)
    }
}

struct CarPark_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CarPark(parkingName: "Kolej Mawar")
        }
    }
}

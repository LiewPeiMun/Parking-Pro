//
//  CollegeView.swift
//  Parking
//
//  Created by stdc user on 02/03/2023.
//

import SwiftUI
import AudioToolbox

struct CollegeView: View {
    
    let durations = [12, 30, 20, 0, 0, 0, 0, 0, 28, 12, 67, 200, 21, 0, 16, 0, 130, 26, 13, 11]
    
    var parkingSpotsMawar: [ParkingSpot] {
        (1...20).map { ParkingSpot(label: "KM\($0)", duration: durations[$0-1]) }
        
    }
    
    var availableParkingSpotsMawar:Int {
        var count = 0
        
        for spot in parkingSpotsMawar {
            if spot.duration==0{
                count+=1
            }
        }
        
       return count
    }
    
    
    var body: some View {
//        NavigationView {
            VStack {
                HeadingView()
                Text("Residential College")
    //                .shadow(color: Color.gray, radius: 2, x: 3, y: 2)
                    .font(.custom("Futura", size: 25))
                    .bold()
                    .foregroundColor(Color("lightblue"))
                
                
                VStack(spacing: 30) {
                        BadgesButton(buttonText: "Kolej Mawar", badgesText: "\(availableParkingSpotsMawar)", carPark: "Kolej Mawar")
                        .onTapGesture {
                            AudioServicesPlaySystemSound(1100)
                        }
                    BadgesButton(buttonText: "Kolej Teratai 1", badgesText: "5", carPark: "Kolej Teratai 1")
                    BadgesButton(buttonText: "Kolej Teratai 2", badgesText: "1", carPark: "Kolej Teratai 2")
                    BadgesButton(buttonText: "Kolej Teratai 3", badgesText: "2", carPark: "Kolej Teratai 3")
                    BadgesButton(buttonText: "Kolej Teratai 4", badgesText: "4", carPark: "Kolej Teratai 4")
                    BadgesButton(buttonText: "Kolej Teratai 5", badgesText: "1", carPark: "Kolej Teratai 5")
                    
                    Spacer()
                }
                
                .padding(.horizontal,20)
            }
//        }
    }
}

struct CollegeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CollegeView()
        }
    }
}

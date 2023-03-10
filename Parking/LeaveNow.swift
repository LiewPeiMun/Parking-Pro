//
//  LeaveNow.swift
//  Parking
//
//  Created by stdc user on 03/03/2023.
//

import SwiftUI
import AudioToolbox

struct LeaveNow: View {
    
    @State private var isHidden = false
    @State var shake = false
    
    var body: some View {
        VStack {
            HeadingView()
            VStack(spacing: 40) {
                VStack{
                    Text("Please wait for")
                        .font(.title)
                    Text("10 minutes,")
                        .font(.title)
                    Text("your car is blocked.")
                        .font(.title)
                }
                .padding(30)
                .background(Color("lightblue"))
                VStack {
                    Button(action: {AudioServicesPlaySystemSound(1100)}){
                        Text("OKAY       ")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                }.navigationBarBackButtonHidden(true)
            }
        }
            .padding(35)
                    .background(Color.green)
                    .border(Color.gray, width: 3)
                    .cornerRadius(5)
            
                    
            
//            if isHidden {
//                Text("You can call the owner of the car: 011-39855889")
            .onAppear {
                                // Start a timer when the view appears
                Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in withAnimation(.default) {
                    // Set the showText property to true after 60 seconds
                    isHidden = true
//                    shake = true
                                    }
                                }
                            }
//            }
            .padding()
            if isHidden { 
                VStack {
                    Text("Seems like the owner still")
                    Text("not moving his car after 10 minutes.")
                    Text("You can call the owner of the car:")
                    Text("011-39855889")
                    .onTapGesture {
                                shake = true
                            }
                    .shake($shake) {
                            print("Finished")
                        }
                    .font(.title)
                    .foregroundColor(Color("red"))
                }
//                .padding()
//                Text("Shake Me")
//                    .font(.title)
//                    .onTapGesture {
//                        shake = true
//                    }
//                    .shake($shake) {
//                        print("Finished")
//                    }
            }
            Spacer()
            NavigationLink(destination: NotiForDoubleParkUser(), label: {VStack {
                Text("Click here to see")
                Text("the notification for the user")
                Text("who block your car ")
            }})
            Spacer()
        }
        
    }
}


struct LeaveNow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LeaveNow()
        }
    }
}

//
//  ConfirmationLeaveView.swift
//  Parking
//
//  Created by stdc user on 07/03/2023.
//

import SwiftUI
import AudioToolbox

struct ConfirmationLeaveView: View {
    
    @State private var isShowingSheet = false
    @Binding var wantCancelLeave: Bool
    
    var body: some View {
        
        NavigationView() {
            VStack{
                HeadingView()
                VStack(spacing: 60) {
                    VStack {
                        Text("Leave")
                        Text("Now?")
                    }
        
                        .padding(90)
                        .font(.custom("Futura", size: 60))
                        .foregroundColor(Color("red"))
                                .background(Color.white)
                                .border(Color.gray, width: 3)
                            .cornerRadius(7)
        

                
                HStack(spacing: 50) {
                    Button(action: { AudioServicesPlaySystemSound(1100)
                        wantCancelLeave = false}) {
                        Text("Cancel")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color("red"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                    
                    }
                    NavigationLink(destination: LeaveNow()) {
                        Text("Yes      ")
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Color("cyan"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct ConfirmationLeaveView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ConfirmationLeaveView(wantCancelLeave: .constant(false))
        }
    }
}

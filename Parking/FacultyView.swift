//
//  FacultyView.swift
//  Parking
//
//  Created by stdc user on 02/03/2023.
//

import SwiftUI

struct FacultyView: View {
    var body: some View {
        
        
//        NavigationView {
            VStack {
                HeadingView()
                Text("Faculty")
                //                .shadow(color: Color.gray, radius: 2, x: 3, y: 2)
                    .font(.custom("Futura", size: 25))
                    .bold()
                    .foregroundColor(Color("lightblue"))
                
                ScrollView {
                    VStack(spacing: 30){
//                        NavigationLink (destination: CarPark()) {
                            BadgesButton(buttonText: "Faculty of Science", badgesText: "1", carPark: "Faculty of Science")
//                        }
                        BadgesButton(buttonText: "Faculty of Arts", badgesText: "5", carPark: "Faculty of Arts")
                        BadgesButton(buttonText: "Faculty of Computer Science", badgesText: "1", carPark: "Faculty of Computer Science")
                        BadgesButton(buttonText: "Faculty of Languages", badgesText: "2", carPark: "Faculty of Languages")
                        BadgesButton(buttonText: "Faculty of Business", badgesText: "4", carPark: "Faculty of Business")
                        BadgesButton(buttonText: "Faculty of Pharmacy", badgesText: "1", carPark: "Faculty of Pharmacy")
                        BadgesButton(buttonText: "Faculty of Medicine", badgesText: "1", carPark: "Faculty of Medicine")
                        BadgesButton(buttonText: "Faculty of Architecture", badgesText: "1", carPark: "Faculty of Architecture")
                        BadgesButton(buttonText: "Faculty of Engineering", badgesText: "1", carPark: "Faculty of Engineering")
                        Spacer()
                    }.padding(.horizontal,20)
                }
            }
//        }
    }
}

struct FacultyView_Previews: PreviewProvider {
    static var previews: some View {
        FacultyView()
    }
}

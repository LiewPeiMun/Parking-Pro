//
//  ContentView.swift
//  Parking
//
//  Created by stdc user on 28/02/2023.
//

import SwiftUI
import AudioToolbox

struct HomeView: View {
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
               HeadingView()

                Spacer()
                TextField("", text: $searchText, prompt:
                            Text("Search").foregroundColor(.white))
                    .font(.custom("Graphik", size: 20))
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .frame(height: 40)
                    .background(Color("darkgrey"))
                    .cornerRadius(8)
                
                    .overlay(
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .padding(.trailing, 10)
                        }
                    ).padding(.vertical, 40)
                    .padding(.horizontal,20)
                
                VStack(spacing: 30){
                    NavigationLink(destination: FacultyView()) {
                        LongButton(buttonText: "Faculty")
                    }
                    NavigationLink(destination: CollegeView()) {
                        LongButton(buttonText: "Residential College")
                    }
                    NavigationLink(destination: OthersView()) {
                        LongButton(buttonText: "Others")
                    }
                }.padding(.horizontal,20)
                
                Spacer().frame(height: 300)
            }
        }.navigationBarBackButtonHidden(true) // hide back button
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//small

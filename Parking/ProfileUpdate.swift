//
//  ContentView.swift
//  Slide 9
//
//  Created by stdc user on 01/03/2023.
//
import SwiftUI

struct ProfileUpdate: View {
    @State private var text = ""
    @State private var name = ""
    @State private var phoneno = ""
    @State private var platno = ""
    @State private var email = ""
    @State private var password = ""
    var action: (() -> Void)? = nil
    var body: some View {
        //NavigationView {
            VStack {
                Spacer()
                HStack (spacing: 40) {
                    Image("logo")
                        .aspectRatio(contentMode: .fit)
                    
                    VStack {
                        Text("Profile Update")
                            .shadow(color: Color.black, radius: 1, x: 3, y: 2)
                            .font(.custom("Futura", size: 29))
                            .bold()
                            .foregroundColor(Color("lightblue"))
                        
                    }
                    
                }
                Spacer().frame(height: 50)
                VStack(spacing: 35){
                    HStack(spacing: 35){
                        
                        Text("NAME")
                        Text(":")
                        TextField("Ahmad Wafiy", text: $name)
                            .disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                    }
                    HStack(spacing: 35){
                        
                        Text("ID NO")
                        Text(":")
                        TextField("2021614824", text: $name)
                            .disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                    }
                    HStack(spacing: 15){
                        
                        Text("PHONE NO")
                        Text(":")
                        TextField("011-49855889", text: $phoneno)
                        //.disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                    }
                    HStack(spacing: 25){
                        
                        Text("PLAT NO")
                        Text(":")
                        TextField("VDN 5437", text: $platno)
                        //.disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                        Button(action: buttonAction) {
                            ZStack {
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.green)
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .imageScale(.small)
                                    .frame(width: 44, height: 44)
                            }
                        }
                    }
                    
                    HStack(spacing: 35){
                        
                        Text("EMAIL")
                        Text(":")
                        TextField("2021614824@student.uitm.edu.my", text: $email)
                        //.disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                            .font(.system(size: 12))
                    }
                    
                    HStack(spacing:14){
                        
                        Text("PASSWORD")
                        Text(":")
                        TextField("XXXXXXX", text: $password)
                        //.disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                    }
                    
                    
                }
                Spacer().frame(height: 40)
                HStack {
                    //                Button("BACK", action: {})
                    //                    .padding()
                    //                    .foregroundColor(.white)
                    //                    .background(Color("red"))
                    //                    .cornerRadius(10)
                    //                    .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                    Spacer().frame(width: 0)
                    NavigationLink(destination: ProfilePage2ndTime()) {
                     Text("SAVE")
                            .padding()
                            .background(Color("cyan"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                     }
                }
            }
            .padding()
        //}
    }
    func buttonAction() { action? ()}
}

struct ProfileUpdate_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUpdate()
    }
}

//
//  ContentView.swift
//  Slide 8
//
//  Created by stdc user on 27/02/2023.
//
import SwiftUI
import AudioToolbox

struct ProfilePage: View {
    @State private var text = ""
    @State private var name = ""
    @State private var idno = ""
    @State private var phoneno = ""
    @State private var platno = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isEditing = false // new state variable
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack (spacing: 40) {
                    NavigationLink(destination: HomeView()) {
                        Image("logo")
                            .aspectRatio(contentMode: .fit)
                    }
                    VStack {
                        Text("Ahmad's Profile")
                            .shadow(color: Color.black, radius: 1, x: 3, y: 2)
                            .font(.custom("Futura", size: 29))
                            .bold()
                            .foregroundColor(Color("lightblue"))
                        
                    }
                }
                Spacer().frame(height: 40)
                VStack(spacing: 30){
                    HStack(spacing: 35){
                        
                        Text("NAME")
                        Text(":")
                        TextField("", text: $name, prompt:
                                    Text("Ahmad Wafiy").foregroundColor(.black))
                            .disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                    }
                    HStack(spacing: 35){
                        Text("ID NO")
                        Text(":")
                        TextField("", text: $idno, prompt:
                                    Text("2021614824").foregroundColor(.black))
                            .disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .multilineTextAlignment(.center)
                    }
                    HStack(spacing: 15) {
                        Text("PHONE NO")
                        Text(":")
                        TextField("", text: $phoneno, prompt:
                                    Text("011-49855889").foregroundColor(.black))
                            .disabled(!isEditing)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .multilineTextAlignment(.center)
                    }
                    HStack(spacing: 25) {
                        Text("PLAT NO")
                        Text(":")
                        TextField("", text: $platno, prompt:
                                    Text("VDN 5437").foregroundColor(.black))
                            .disabled(!isEditing)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .multilineTextAlignment(.center)
                    }
                    HStack(spacing: 35) {
                        Text("EMAIL")
                        Text(":")
                        TextField("", text: $email, prompt:
                                    Text("2021614824@student.uitm.edu.my").foregroundColor(.black))
                            .disabled(!isEditing)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .font(.system(size: 12))
                            .multilineTextAlignment(.center)
                    }
                    HStack(spacing: 14) {
                        Text("PASSWORD")
                        Text(":")
                        TextField("", text: $password, prompt:
                                    Text("XXXXXXX").foregroundColor(.black))
                            .disabled(!isEditing)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .multilineTextAlignment(.center)
                    }
                    
                    HStack {
                        Button(action: {AudioServicesPlaySystemSound(1100);
                            isEditing.toggle() // toggle the editable state
                        }) {
                            Text(isEditing ? "SAVE" : "EDIT") // change the button text based on the editable state
                                .padding()
                                .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                                .background(isEditing ? Color.green : Color("cyan"))
                                .foregroundColor(isEditing ? Color.white : Color.black)
                        }
                        .cornerRadius(10)
                        .padding(.top, 10)
                        
                       
                    }
                }
            }
            .padding()
            .padding(.bottom, 50)
            Spacer()
        }.navigationBarBackButtonHidden(true) // hide back button
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}

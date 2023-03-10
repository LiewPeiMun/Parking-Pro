//
//  ContentView.swift
//  Slide 9
//
//  Created by stdc user on 01/03/2023.
//
import SwiftUI
import AudioToolbox

struct Registration: View {
    @State private var name = ""
    @State private var idno = ""
    @State private var phoneno = ""
    @State private var platno = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
//        NavigationView {
            VStack {
                Spacer()
                HStack (spacing: 40) {
                    Image("logo")
                        .aspectRatio(contentMode: .fit)
                    
                    VStack {
                        Text("REGISTRATION")
                            .shadow(color: Color.black, radius: 1, x: 3, y: 2)
                            .font(.custom("Futura", size: 29))
                            .bold()
                            .foregroundColor(Color("lightblue"))
                        
                    }
                    
                }
                Spacer().frame(height: 20)
                VStack(spacing: 20){
                    HStack(spacing: 35){
                        
                        Text("NAME")
                        Text(":")
                        TextField("", text: $name)
                            //.disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                    }
                    HStack(spacing: 35){
                        
                        Text("ID NO")
                        Text(":")
                        TextField("", text: $idno)
                            //.disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                    }
                    HStack(spacing: 15){
                        
                        Text("PHONE NO")
                        Text(":")
                        TextField("", text: $phoneno)
                            //.disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                    }
                        ZStack {
                            Image(systemName: "plus")
                            HStack(spacing: 25){
                                
                                Text("PLAT NO")
                                Text(":")
                                TextField("", text: $platno)
                                    //.disabled(true)
                                    .padding()
                                    .background(Color("grey"))
                                    .cornerRadius(10)
                                    .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                                    .foregroundColor(Color.black)
                            }
                        }
                    
                    HStack(spacing: 35){
                        
                        Text("EMAIL")
                        Text(":")
                        TextField("", text: $email)
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
                        SecureField("", text: $password)
                            //.disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                    }
                    HStack(spacing:14){
                        VStack {
                            Text("CONFIRM")
                            Text("PASSWORD")
                        }
                            Text(":")
                        SecureField("", text: $confirmPassword)
                            //.disabled(true)
                            .padding()
                            .background(Color("grey"))
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .foregroundColor(Color.black)
                    }
                    
                   
                }
                Spacer().frame(height: 30)
                HStack {
                    //                Button("BACK", action: {})
                    //                    .padding()
                    //                    .foregroundColor(.white)
                    //                    .background(Color("red"))
                    //                    .cornerRadius(10)
                    //                    .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                    Spacer().frame(width: 0)
                    
                        Button(action: {AudioServicesPlaySystemSound(1100)}) {
                            NavigationLink(destination: DoneRegistration()) {
                            Text("SIGN UP")
                                .padding()
                                .foregroundColor(.black)
                                .background(Color("yellow"))
                                .cornerRadius(10)
                                .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                        }
                    }
                }
            }
            .padding()
        .padding(.bottom, 30)
//        }
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Registration()
        }
    }
}

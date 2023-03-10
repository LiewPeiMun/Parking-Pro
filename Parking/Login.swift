import SwiftUI
import AudioToolbox

struct Login: View {
    @AppStorage ("email") private var email = ""
    @AppStorage ("password") private var password = ""
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Image("logoBig")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .scaledToFit()
                .scaleEffect(1.5)
                .clipped()
            
            VStack(spacing: -10) {
                Text("WELCOME TO")
                    .font(.custom("Futura", size: 30))
                    .foregroundColor(Color("lightblue"))
                    .padding(.top, 16)
                
                Text("PARKING PRO")
                    .font(.custom("Futura", size: 30))
                    .foregroundColor(Color("lightblue"))
                    .padding(.top, 16)
            }
            Text("EMAIL:")
                .font(.title2)
                    .padding(.top, 8)
            
            RoundedRectangle(cornerRadius: 10)
                            .fill(Color("grey"))
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .frame(height: 64)
                            .overlay(
                                TextField("Enter your email", text: $email)
                                    .padding(.horizontal, 16)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    
                                )
                            .padding(.horizontal, 16)
                                            .padding(.top, 8)
            
            Text("PASSWORD:")
                .font(.title2)
                    .padding(.top, 8)
            RoundedRectangle(cornerRadius: 10)
                            .fill(Color("grey"))
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            .frame(height: 64)
                            .overlay(
                                SecureField("Enter your password", text: $password)
                                    .padding(.horizontal, 16)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    
                                )
                            .padding(.horizontal, 16)
                                            .padding(.top, 8)
            
            VStack {
                Button(action: {
                    if email.isEmpty || password.isEmpty {
                        self.alertMessage = "Please fill in all fields."
                        self.isShowingAlert = true
                    } else {
                        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: TabView {
                            HomeView()
                                .tabItem {
                                    Image(systemName: "house")
                                    Text("Home")
                                }
                            MapView()
                                .tabItem {
                                    Label("Map", systemImage: "map")
                                }
                            ProfilePage()
                                .tabItem {
                                    Image(systemName: "person")
                                    Text("Profile")
                                }
                        })
                        UIApplication.shared.windows.first?.makeKeyAndVisible()// Handle guest login button action here
                        // Handle login action
                        // After successful login, take user to main screen
                    }
                }) {
                    Text("LOGIN        ")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color("yellow"))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                        .padding(.horizontal, 100)
                        .padding(.top, 30)
                }
            }
    
            Spacer()
                .alert(isPresented: $isShowingAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

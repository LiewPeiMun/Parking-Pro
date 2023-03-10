import SwiftUI
import AudioToolbox

struct firstView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack(spacing: -80) {
                    
                    Text("Parking Pro")
                        .shadow(color: Color.black, radius: 1, x: 3, y: 2)
                        .font(.custom("Futura", size: 50))
                        .bold()
                        .foregroundColor(Color("lightblue"))
                    
                    Image("logoBig")
                        .resizable()
                        .frame(width: 800, height: 500)
                    
                    Button(action: {
                        AudioServicesPlaySystemSound(1100)
                        // Add login button action here
                    }){
                            NavigationLink (
                                destination: Login()) {
                                    Text("LOGIN                ")
                                        .padding()
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .background(Color("yellow"))
                                        .cornerRadius(10)
                                        .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                            
                        }
                    }
                }
                Spacer().frame(height: 20)
                Button(action: {
                    AudioServicesPlaySystemSound(1100)
                    // Add guest button action here
                }){
                    NavigationLink (
                        destination: Guest()) {
                    Text("GUEST               ")
                        .padding()
                        .foregroundColor(.black)
                        .font(.title2)
                        .background(Color("yellow"))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 5)
                }
            }
                
                Spacer().frame(height: 30)
                
                    Text("LOG IN WITH :")
                
                    Image("FB")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                
                Spacer()
                HStack {
                    Text("Dont have account?")
                    NavigationLink(
                        destination: Registration()) {
                            Text("Sign up")
                                .underline()
                        }
                    .onTapGesture {
                        AudioServicesPlaySystemSound(1100)
                        // Add sign up button action here
                    }
                }.foregroundColor(Color("red"))
            }
            .padding()
        }
    }
}

struct firstView_Previews: PreviewProvider {
    static var previews: some View {
        firstView()
    }
}

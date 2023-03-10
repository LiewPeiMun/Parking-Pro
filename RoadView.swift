import SwiftUI

struct RoadView: View {
    var body: some View {
        ZStack {
            Color(red: 0.45, green: 0.45, blue: 0.45)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 10) // change this value to adjust the width of the line
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
struct RoadView_Previews: PreviewProvider {
    static var previews: some View {
        RoadView()
    }
}

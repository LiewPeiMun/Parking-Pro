//
//  ContentView.swift
//  Time Picker
//
//  Created by stdc user on 05/03/2023.
//

import SwiftUI

struct Duration: View {

    @State var data: [(String, [String])] = [
        ("One", Array(0...8).map { "\($0):" }),
        ("Two", Array(arrayLiteral: 0, 15, 30, 45).map { "\($0)" })
    ]
    @Binding var selection: [String]

    var body: some View {
        VStack(spacing: -50) {
            Text(verbatim: "Duration: \(selection)")
                .foregroundColor(Color("orange"))
                            .font(.system(size: 20))
                            .bold()
            MultiPicker(data: data, selection: $selection).frame(height: 300)
        }
    }

}

struct Duration_Previews: PreviewProvider {
    static var previews: some View {
        Duration( selection: .constant(["00","00"]))
    }
}

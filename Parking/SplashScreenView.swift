//
//  SplashScreenView.swift
//  MaquanProject
//
//  Created by stdc user on 02/03/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity =  0.5
    
    var body: some View {
        if isActive {
            firstView()
        } else {
            VStack {
                VStack {
                    Image("logoBig")
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear() {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

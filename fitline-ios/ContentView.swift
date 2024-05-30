//
//  ContentView.swift
//  fitline-ios
//
//  Created by 김성빈 on 4/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            VStack {
                Signin()
            }
            .padding()
        } else {
            SplashScreen()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}

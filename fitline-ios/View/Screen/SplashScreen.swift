//
//  Screen.swift
//  fitline-ios
//
//  Created by 준기 on 4/29/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                HStack(spacing: 20) {
                    Image("Logo")
                        .resizable()
                        .frame(width: 60,height: 60)
                    
                    CustomText(text: "FitLine", color: .Colors.Grayscale._90, fontType: .Display)
                }
                
                CustomText(text: "체형 맞춤 건강 관리 앱", color: .Colors.Grayscale._50, fontType: .Body)
            }
        }
    }
}

#Preview {
    SplashScreen()
}

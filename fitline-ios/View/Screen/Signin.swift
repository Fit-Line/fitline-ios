//
//  Signin.swift
//  fitline-ios
//
//  Created by 준기 on 4/29/24.
//

import SwiftUI

struct Signin: View {
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 8) {
                    HStack(spacing: 20) {
                        Image("Logo")
                            .resizable()
                            .frame(width: 60, height: 60)
                        
                        CustomText(text: "FitLine", color: .Colors.Grayscale._90, fontType: .Display)
                    }
                    
                    CustomText(text: "체형 맞춤 건강 관리 앱", color: .Colors.Grayscale._50, fontType: .Body)
                }
            }
            VStack {
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                    HStack(spacing: 10){
                        Image("GoogleLogo")
                            .resizable()
                            .frame(width: 18, height: 18)
                        CustomText(text: "구글 계정으로 로그인", color: .Colors.Grayscale._10, fontType: .BodyStrong)
                    }
                    .cornerRadius(12)
                    .foregroundColor(Color.Colors.Grayscale._10)
                    .frame(width: .infinity, height: 58)
                    
                }).frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .background(Color.Colors.Grayscale._90)
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
            }
        }

    }
}

#Preview {
    Signin()
}

//
//  NickName.swift
//  fitline-ios
//
//  Created by 준기 on 6/10/24.
//

import SwiftUI

struct NickName: View {
    @State private var nickname: String = ""

    private var isNicknameValid: Bool {
        return !nickname.isEmpty
    }

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Header(title: "프로필")
                VStack(alignment: .leading, spacing: 20) {
                    CustomText(text: "닉네임을\n입력해주세요", color: .Colors.Grayscale._90, fontType: .Title)

                    ZStack(alignment: .trailing) {
                        TextField("닉네임을 입력해주세요", text: $nickname)
                            .padding(.vertical, 11)
                            .overlay(
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(Color.Colors.Grayscale._90),
                                alignment: .bottom
                            )

                        if !nickname.isEmpty {
                            Button(action: {
                                nickname = ""
                            }) {
                                Image("Close")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.Colors.Grayscale._60)
                                    .padding(.trailing, 5)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)

                Spacer()

                NextButton(destination: EmptyView(), isActive: isNicknameValid)
            }
        }
    }
}

#Preview {
    NickName()
}

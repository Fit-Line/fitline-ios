//
//  Typography.swift
//  fitline-ios
//
//  Created by 김성빈 on 4/29/24.
//

import SwiftUI

struct CustomText: View {
    let text: String
    let color: Color
    let fontType: FontType

    var body: some View {
        let fontSetting = fontType.setting
        Text(text)
            .font(.custom(fontSetting.name, size: fontSetting.size))
            .tracking((fontSetting.size * fontSetting.tracking) / 100)
            .kerning(fontSetting.kerning)
            .foregroundStyle(color)
    }
}

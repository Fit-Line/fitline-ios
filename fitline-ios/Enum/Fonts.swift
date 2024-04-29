import SwiftUI

struct FontSetting {
    var name: String
    var size: CGFloat
    var kerning: CGFloat
    var tracking: CGFloat = -2.5
}

enum FontType {
    case Display
    case TitleLarge
    case Title
    case SubTitle
    case BodyStrong
    case Body
    case CaptionStrong
    case Caption
    
    var setting: FontSetting {
        switch self {
        case .Display:
            return FontSetting(name: "Pretendard-Bold", size: 48, kerning: 54)
        case .TitleLarge:
            return FontSetting(name: "Pretendard-Bold", size: 38, kerning: 41)
        case .Title:
            return FontSetting(name: "Pretendard-Bold", size: 28, kerning: 34)
        case .SubTitle:
            return FontSetting(name: "Pretendard-SemiBold", size: 20, kerning: 25)
        case .BodyStrong:
            return FontSetting(name: "Pretendard-SemiBold", size: 16, kerning: 22)
        case .Body:
            return FontSetting(name: "Pretendard-Regular", size: 16, kerning: 22)
        case .CaptionStrong:
            return FontSetting(name: "Pretendard-SemiBold", size: 14, kerning: 18)
        case .Caption:
            return FontSetting(name: "Pretendard-Regular", size: 14, kerning: 18)
        }
    }
}

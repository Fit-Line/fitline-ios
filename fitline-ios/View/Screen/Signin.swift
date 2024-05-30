import SwiftUI

struct Signin: View {
    var body: some View {
        NavigationView {
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

                    NavigationLink(destination: Header()) {
                        HStack(spacing: 10) {
                            Image("GoogleLogo")
                                .resizable()
                                .frame(width: 18, height: 18)
                            CustomText(text: "구글 계정으로 로그인", color: .Colors.Grayscale._10, fontType: .BodyStrong)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 58)
                        .background(Color.Colors.Grayscale._90)
                        .cornerRadius(12)
                        .padding(.horizontal, 20)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    Signin()
}

import SwiftUI

struct ToggleButtonWithLabel: View {
    @Binding var isToggleOn: Bool
    var label: () -> CustomText

    var body: some View {
        HStack(spacing: 10) {
            Toggle(isOn: $isToggleOn) {
                EmptyView()
            }
            .toggleStyle(CustomToggleStyle())
            label()
        }
    }
}

struct AgreeTerm: View {
    @State private var isSelectedAll = false
    @State private var isServiceTermsAccepted = false
    @State private var isPrivacyPolicyAccepted = false
    @State private var showAlert = false

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Header(title: "약관 동의")

                VStack(alignment: .leading, spacing: 20) {
                    Image("Logo")
                        .resizable()
                        .frame(width: 60, height: 60)

                    VStack(alignment: .leading, spacing: 4) {
                        CustomText(text: "FitLine에\n오신 것을 환영합니다!", color: .Colors.Grayscale._90, fontType: .Title)
                        CustomText(text: "서비스 이용을 위해 이용약관에 동의해주세요", color: .Colors.Grayscale._50, fontType: .Body)
                    }
                }
                .padding(.leading, 24)

                Spacer()

                VStack(alignment: .leading, spacing: 16) {
                    ToggleButtonWithLabel(isToggleOn: $isSelectedAll) {
                        CustomText(text: "필수 약관 전체동의", color: .Colors.Grayscale._90, fontType: .BodyStrong)
                    }
                    .onChange(of: isSelectedAll) { newValue in
                        withAnimation {
                            isServiceTermsAccepted = newValue
                            isPrivacyPolicyAccepted = newValue
                        }
                    }

                    Divider()
                        .background(Color.Colors.Grayscale._20)

                    VStack(alignment: .leading, spacing: 14) {
                        ToggleButtonWithLabel(isToggleOn: $isServiceTermsAccepted) {
                            CustomText(text: "서비스 이용약관 동의 (필수)", color: .Colors.Grayscale._90, fontType: .Body)
                        }
                        ToggleButtonWithLabel(isToggleOn: $isPrivacyPolicyAccepted) {
                            CustomText(text: "개인정보 수집 및 이용 동의 (필수)", color: .Colors.Grayscale._90, fontType: .Body)
                        }
                    }
                }
                .padding([.horizontal, .bottom], 24)

                NextButton(destination: NextPageView(), isActive: isServiceTermsAccepted && isPrivacyPolicyAccepted)
            }
        }
    }
}

#Preview {
    AgreeTerm()
}

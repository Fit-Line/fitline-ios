import SwiftUI
import Combine

struct ProfileInfo: View {
    @State private var name: String = ""
    @State private var gender: String = ""
    @State private var weight: String = ""
    @State private var age: String = ""
    @State private var bodyFat: String = ""
    
    @State private var showGenderPicker = false
    
    var body: some View {
        VStack {
            Header(title: "프로필")
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    CustomText(text: "정보를\n입력해주세요", color: .Colors.Grayscale._90, fontType: .Title)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 20)
                    
                    Group {
                        inputField(title: "별명", placeholder: "별명을 입력해주세요", text: $name, isRequired: true, maxLength: 8)
                        genderField(title: "성별", placeholder: "성별을 선택해주세요", text: $gender, isRequired: true)
                        inputFieldWithSuffix(title: "몸무게", placeholder: "몸무게를 입력해주세요", text: $weight, isRequired: true, suffix: "kg", allowedCharacters: "0123456789.", maxValue: 200)
                        inputFieldWithSuffix(title: "나이", placeholder: "나이를 입력해주세요", text: $age, isRequired: true, suffix: "세", allowedCharacters: "0123456789", maxValue: 99)
                        inputFieldWithSuffix(title: "체지방", placeholder: "체지방을 입력해주세요", text: $bodyFat, isRequired: false, suffix: "%", allowedCharacters: "0123456789.")
                    }
                    .padding(.horizontal, 24)
                }
            }
            Spacer()
            NextButton(destination: EmptyView(), isActive: isFormValid)
                .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .actionSheet(isPresented: $showGenderPicker) {
            ActionSheet(title: Text("성별을 선택해주세요"), buttons: [
                .default(Text("남자")) { gender = "남자" },
                .default(Text("여자")) { gender = "여자" },
                .cancel()
            ])
        }
    }
    
    private var isFormValid: Bool {
        return !name.isEmpty && !gender.isEmpty && !weight.isEmpty && !age.isEmpty
    }
    
    private func inputField(title: String, placeholder: String, text: Binding<String>, isRequired: Bool, maxLength: Int? = nil) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 2) {
                CustomText(text: title, color: .Colors.Grayscale._80, fontType: .Caption)
                if isRequired {
                    CustomText(text: "*", color: .Colors.System.error, fontType: .Caption)
                }
            }
            TextField(placeholder, text: text)
                .padding(.vertical, 11)
                .onReceive(Just(text.wrappedValue)) { newValue in
                    if let maxLength = maxLength, newValue.count > maxLength {
                        text.wrappedValue = String(newValue.prefix(maxLength))
                    }
                }
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.Colors.Grayscale._40),
                    alignment: .bottom
                )
        }
    }
    
    private func genderField(title: String, placeholder: String, text: Binding<String>, isRequired: Bool) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 2) {
                CustomText(text: title, color: .Colors.Grayscale._80, fontType: .Caption)
                if isRequired {
                    CustomText(text: "*", color: .Colors.System.error, fontType: .Caption)
                }
            }
            HStack {
                TextField(placeholder, text: text)
                    .padding(.vertical, 11)
                    .disabled(true)
                Button(action: {
                    showGenderPicker = true
                }) {
                    Image("DownArrow")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.Colors.Grayscale._40),
                alignment: .bottom
            )
        }
    }
    
    private func inputFieldWithSuffix(title: String, placeholder: String, text: Binding<String>, isRequired: Bool, suffix: String, allowedCharacters: String, maxValue: Int? = nil) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 2) {
                CustomText(text: title, color: .Colors.Grayscale._80, fontType: .Caption)
                if isRequired {
                    CustomText(text: "*", color: .Colors.System.error, fontType: .Caption)
                }
            }
            HStack {
                TextField(placeholder, text: text)
                    .padding(.vertical, 11)
                    .onReceive(Just(text.wrappedValue)) { newValue in
                        let filtered = newValue.filter { allowedCharacters.contains($0) }
                        if filtered != newValue {
                            text.wrappedValue = filtered
                        }
                        if let maxValue = maxValue, let intValue = Int(filtered), intValue > maxValue {
                            text.wrappedValue = String(filtered.prefix(filtered.count - 1))
                        }
                    }
                Text(suffix)
                    .foregroundColor(Color.Colors.Grayscale._90)
                    .padding(.trailing, 5)
            }
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.Colors.Grayscale._40),
                alignment: .bottom
            )
        }
    }
}

#Preview {
    ProfileInfo()
}

import SwiftUI

struct Header: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            HStack {
                Spacer()
                CustomText(text: "Main Content", color: .Colors.Grayscale._90, fontType: .SubTitle)
                Spacer()
            }
            .padding()
            .frame(height: 44)
        }
        .navigationBarTitle("")
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image("LeftArrow")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .foregroundColor(.blue)
                }
            }
            ToolbarItem(placement: .principal) {
                CustomText(text: "약관 동의", color: .Colors.Grayscale._90, fontType: .SubTitle)
            }
        }
    }
}

#Preview {
    NavigationView {
        Header()
    }
}

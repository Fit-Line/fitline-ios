import SwiftUI

struct Header: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var title: String
    var body: some View {
        VStack {
            HStack {
                NavigationView {}.navigationTitle("")
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image("LeftArrow")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .offset(x: -24, y: 0)
                                    .padding(12)
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            CustomText(text: title, color: .Colors.Grayscale._90, fontType: .SubTitle)
                        }
                    }
            }
        }.frame(maxWidth: .infinity, maxHeight: 56)
    }
}

#Preview {
    Header(title: "약관 동의")
}

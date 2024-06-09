import SwiftUI

struct NextButton<Destination: View>: View {
    var destination: Destination
    var isActive: Bool

    var body: some View {
        NavigationLink(destination: isActive ? AnyView(destination) : AnyView(EmptyView())) {
            HStack(spacing: 4) {
                CustomText(text: "다음", color: .Colors.Grayscale._10 , fontType: .BodyStrong)
                Image("RightArrow")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(isActive ? .Colors.Grayscale._10 : .Colors.Grayscale._50)
            }
            .frame(height: 58)
            .frame(maxWidth: .infinity)
            .background(isActive ? Color.Colors.Grayscale._90 : Color.Colors.Grayscale._40)
            .cornerRadius(12)
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: 58)
        .disabled(!isActive)
    }
}

struct NextPageView: View {
    var body: some View {
        Text("This is the next page")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    VStack(spacing: 20) {
         NextButton(destination: NextPageView(), isActive: true)
         NextButton(destination: NextPageView(), isActive: false)
     }
}

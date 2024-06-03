import SwiftUI

struct NextButton<Destination: View>: View {
    var destination: Destination
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: destination) {
                    HStack(spacing: 4) {
                        CustomText(text: "다음", color: .Colors.Grayscale._10, fontType: .BodyStrong)
                        Image("RightArrow")
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                    .frame(height: 58)
                    .frame(maxWidth: .infinity)
                    .background(Color.Colors.Grayscale._90)
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                }
            }
        }
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
    NextButton(destination: NextPageView())
}

import SwiftUI

struct ToggleButton: View {
    @State var isToggleOn = false
    var body: some View {
        VStack {
            Toggle(isOn: self.$isToggleOn) {
                EmptyView()
            }
            .toggleStyle(CustomToggleStyle())
        }
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: configuration.isOn ? .trailing : .leading) {
            Image(configuration.isOn ? "CheckedBox" : "Box")
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    withAnimation {
                        configuration.$isOn.wrappedValue.toggle()
                    }
                }
        }
    }
}

#Preview {
    ToggleButton()
}

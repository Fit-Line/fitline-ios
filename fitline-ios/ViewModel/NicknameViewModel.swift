import SwiftUI
import Combine

struct NicknameResponse: Codable {
    let isDuplicate: Bool
}

class NicknameViewModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var isDuplicate: Bool? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private var cancellables = Set<AnyCancellable>()
    
    func checkNickname() {
        guard !nickname.isEmpty else {
            self.errorMessage = "Nickname cannot be empty"
            return
        }
        
        let urlString = "https://yourapi.com/check_nickname?nickname=\(nickname)"
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        self.isLoading = true
        self.errorMessage = nil
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: NicknameResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { response in
                self.isDuplicate = response.isDuplicate
            })
            .store(in: &self.cancellables)
    }
}

struct NicknameCheckView: View {
    @ObservedObject var viewModel: NicknameViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your nickname", text: $viewModel.nickname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                viewModel.checkNickname()
            }) {
                Text("Check Nickname")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            if let isDuplicate = viewModel.isDuplicate {
                Text(isDuplicate ? "Nickname is already taken." : "Nickname is available.")
                    .foregroundColor(isDuplicate ? .red : .green)
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NicknameCheckView(viewModel: NicknameViewModel())
    }
}

class MockNicknameViewModel: NicknameViewModel {
    override func checkNickname() {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            self.isDuplicate = self.nickname == "안녕"
            self.errorMessage = nil
        }
    }
}

#Preview {
    NicknameCheckView(viewModel: MockNicknameViewModel())
}

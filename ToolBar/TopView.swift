import SwiftUI

enum Path: String, Hashable {
    case account
    case notification
}

struct AccountView: View {
    var body: some View {
        Text("Account")
    }
}

struct NotificationView: View {
    var body: some View {
        Text("Notification")
    }
}

struct TopView: View {
    @State private var path = [Path]()
    
    var body: some View {
        NavigationStack(path: $path) {
            Text("Top")
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Top")
                .navigationDestination(for: Path.self) { path in
                    switch path {
                    case .account:
                        AccountView()
                    case .notification:
                        NotificationView()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            path.append(.account)
                        } label: {
                            Image(systemName: "person.circle")
                                .fontWeight(.bold)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ZStack(alignment: .topTrailing) {
                            Button {
                                path.append(.notification)
                            } label: {
                                Image(systemName: "bell")
                                    .fontWeight(.bold)
                            }
                            
                            Group {
                                Text("2")
                                    .frame(minWidth: 14)
                                    .padding(3)
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                                    .background(.blue)
                                    .cornerRadius(40)
                                    .offset(x: 6, y: -4)
                            }
                            .allowsHitTesting(false)
                        }
                    }
                }
        }
        .tint(.init(red: 0.2, green: 0.2, blue: 0.2))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}

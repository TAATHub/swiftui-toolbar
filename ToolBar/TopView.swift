import SwiftUI

enum Path: String, Hashable {
    case account
    case notification
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
                // ナビゲーションバーに要素を配置
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        AccountIcon()
                    }
                    
                    ToolbarItem(placement: .principal) {
                        principalIcon()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        notificationIcon()
                    }
                }
        }
        // ナビゲーションバー全体にtintColorを指定
        .tint(.init(red: 0.2, green: 0.2, blue: 0.2))
    }
    
    private func AccountIcon() -> some View {
        Button {
            path.append(.account)
        } label: {
            Image(systemName: "person.circle")
                .fontWeight(.bold)
        }
    }
    
    private func principalIcon() -> some View {
        Image("taat")
            .resizable()
            .scaledToFill()
            .frame(width: 36, height: 36)
            .clipShape(Circle())
    }
    
    private func notificationIcon() -> some View {
        // アイコンとバッジを右上揃えにする
        ZStack(alignment: .topTrailing) {
            Button {
                path.append(.notification)
            } label: {
                Image(systemName: "bell")
                    .fontWeight(.bold)
            }
            
            Text("2")
                .frame(minWidth: 14)
                .padding(3)
                .font(.system(size: 12))
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(40)
                // バッジの位置をアイコンに対してやや右上にずらす
                .offset(x: 6, y: -4)
                // バッジ部分でのタップイベントをアイコンに透過させる
                .allowsHitTesting(false)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}

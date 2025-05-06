import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                CarListView()
                .tabItem {
                    Label("Catálogo", systemImage: "car")
                }

                FavoritesView()
                .tabItem {
                    Label("Favoritos", systemImage: "heart.fill")
                }
            }
    }
}
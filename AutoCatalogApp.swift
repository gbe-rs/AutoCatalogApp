import SwiftUI

@main
struct AutoCatalogApp: App {
    var body: some Scene {
        WindowGroup {
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
}
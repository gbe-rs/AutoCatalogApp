import SwiftUI

@main
struct AutoCatalogApp: App {
    @StateObject private var favoritesViewModel = FavoritesViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(favoritesViewModel)
        }
    }
}
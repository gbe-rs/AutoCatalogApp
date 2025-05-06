import Foundation

class FavoritesViewModel: ObservableObject {
    @Published private(set) var favorites: [Car] = []

    private let key = "favorite_cars"

    init() {
        loadFavorites()
    }

    func isFavorite(_ car: Car) -> Bool{
        favorites.contains(where: {$0.id == car.id})
    }

    func toggleFavorite(_ car: Car) {
        if isFavorite(car) {
            favorites.removeAll { $0.id == car.id}
        } else {
            favorites.append(car)
        }
        saveFavorites()
    }

    func saveFavorites() {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func loadFavorites() {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([Car].self, from: data) else {
            return
        }
        favorites = decoded   
    }
}
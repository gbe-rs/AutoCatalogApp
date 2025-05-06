import SwiftUI

struct FavoritesView: View {
    @StateObject private var favoritesVM = FavoritesViewModel()

    var body: some View{
        NavigationView {
            if favoritesVM.favorites.isEmpty {
                Text("Nenhum carro favoritado.")
                .foregroundColor(.gray)
                .italic()
            } else {
                List(favoritesVM.favorites) { car in
                    NavigationLink(destination: CarDetailView(car: car)) {
                        CarRowView(car: car)
                    }
                }
                .navigationTitle("Favoritos")
            }
        }
    }
}
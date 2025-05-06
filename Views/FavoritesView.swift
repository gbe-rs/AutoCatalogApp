import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel

    var body: some View{
        NavigationView {
            if favoritesViewModel.favorites.isEmpty {
                Text("Nenhum carro favoritado.")
                .foregroundColor(.gray)
                .italic()
            } else {
                List(favoritesViewModel.favorites) { car in
                    NavigationLink(destination: CarDetailView(car: car)) {
                        CarRowView(car: car)
                    }
                }
                .navigationTitle("Favoritos")
            }
        }
    }
}
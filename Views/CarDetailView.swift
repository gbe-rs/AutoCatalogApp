import SwiftUI

struct CarDetailView: View {
    let car: Car

    @EnvironmentObject var favoritesVM: FavoritesViewModel


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: car.imageURL)) { image in
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .cornerRadius(12)

                HStack {
                    Spacer()
                    Button(action: {
                        favoritesVM.toggleFavorite(car)
                    }) {
                        Image(systemName: favoritesVM.isFavorite(car) ? "heart.fill" : "heart")
                            .resizable()
                            .foregroundColor(.red)
                    }
                    .padding(.trailing)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("\(car.brand) \(car.model)")
                        .font(.title)
                        .bold()

                    Text("Ano: \(String(car.year))")
                    .font(.headline)

                    Text("Preço: R$ \(car.price, specifier: "%.2f")")
                        .font(.title2)
                        .foregroundColor(.green)

                    Divider()

                    Text("Descrição")
                        .font(.headline)

                    Text("Carro Modelo \(car.model) da marca \(car.brand), fabricado em \(String(car.year)). Ideal para quem busca desempenho, conforto e economia.")    
                        .font(.body)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(car.model)
        .navigationBarTitleDisplayMode(.inline)
    }
}
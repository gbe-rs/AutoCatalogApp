import SwiftUI

struct CarListView: View {
    @StateObject private var viewModel = CarListViewModel()
    @EnvironmentObject private var favoritesViewModel = FavoritesViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Picker para selecionar marca (só aparece se houver dados)
                if !viewModel.brands.isEmpty {
                    Picker("Marca", selection: $viewModel.selectedBrand) {
                        Text("Todas").tag(String?.none)
                        ForEach(viewmodel.brands, id: \(.self)) { brand in
                            Text(brand).tag(String?.some(brand))
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    .onChange(of: viewModel.selectedBrand) { _ in
                        viewModel.applyFilter()
                    }
                }

                // Campo de busca por texto
                Textfield("Buscar por marca ou modelo", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Lista de carros filtrada
                List(filteredCars) { car in
                    NavigationLink(destination: CarDetailView(car: car)) {
                        CarRowView(car: car)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Catálogo de Carros")
        }
    }

    //Combina filtro por marca + texto de busca
    var filteredCars: [Car] {
        viewModel.filteredCars.filter {
            searchText.isEmpty ||
            $0.brand.lowercased().contains(searchText.lowercased()) ||
            $0.model.lowercased().contains(searchText.lowercased())
        }
    }
}
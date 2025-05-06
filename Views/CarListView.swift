import SwiftUI

struct CarListView: View {
    @StateObject private var viewModel = CarListViewModel()
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Picker para selecionar marca (só aparece se houver dados)
                if !viewModel.brands.isEmpty {
                    Picker("Marca", selection: $viewModel.selectedBrand) {
                        Text("Todas").tag(nil as String?)
                        ForEach(viewModel.brands, id: \.self) { brand in
                            Text(brand).tag(brand as String?)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    .onChange(of: viewModel.selectedBrand) { _ in
                        viewModel.applyFilter(searchText: searchText)
                    }
                }

                // Campo de busca por texto
                TextField("Buscar por marca ou modelo", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .onChange(of: searchText) { newValue in
                        viewModel.applyFilter(searchText: newValue)
                    }

                // Lista de carros filtrada
                List(viewModel.filteredCars) { car in
                    NavigationLink(destination: CarDetailView(car: car)) {
                        CarRowView(car: car)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Catálogo de Carros")
        }
    }
}
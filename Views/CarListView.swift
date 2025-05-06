import SwiftUI

struct CarListView: View {
    @StateObject private var viewModel = CarListViewModel()

    var body: some View {
        NavigationView {
            VStack {
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

                    List(viewModel.filteredCars) { car in
                        NavigationLink(destination: CarDetailView(car: car)) {
                            CarRowView(car: car)
                        }
                    }
                    .listStyle(.plain)
            }
            .navigationTitle("Catálogo de Carros")
        }
    }
}
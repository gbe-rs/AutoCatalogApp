import Foundation
import Combine

class CarListViewModel: ObservableObject {
    @Published var allCars: [Car] = []
    @Published var filteredCars: [Car] = []
    @Published var selectedBrand: String? = nil

    var brands: [String] {
        let unique = Set(allCars.map { \.brand })
        return Array(unique).sorted()
    }

    init() {
        loadCars()
    }

    private func loadCars() {
        guard let url = Bundle.main.url(forResource: "MockData", withExtension: "json") else {
            print("Erro: Arquivo MockData.json não encontrado.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Car].self, from: data)
            self.allCars = decoded
            applyFilter()
        } catch {
            print("Erro ao carregar ou decodificar os dados: \(error)")
        }
        

    }

    // Aplica filtro por marca e texto de busca (opcional)
    func applyFilter(searchText: String = "") {
        filteredCars = allCars.lazy.filter { car in
            let matchesBrand = selectedBrand == nil || car.brand == selectedBrand
            let matchesSearch = searchText.isEmpty ||
                car.brand.lowercased().contains(searchText.lowercased()) ||
                car.model.lowercased().contains(searchText.lowercased()) 
            return matchesBrand && matchesSearch
        }
    }

    func clearFilter() {
        selectedBrand = nil
        applyFilter()
    }
}
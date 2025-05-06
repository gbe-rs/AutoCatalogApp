import Foundation
import Combine

class CarListViewModel: ObservableObject {
    @Published var allCars: [Car] = []
    @Published var filteredCars: [Car] = []
    @Published var selectedBrand: String? = nil

    var brands: [String] {
        let unique = Set(allCars.map { $0.brand })
        return Array(unique).sorted()
    }

    init() {
        loadCars()
    }

    private func loadCars() {
        guard let url = Bundle.main.url(forResource: "MockData", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([Car].self, from: data) else {
                return
              }
              self.allCars = decoded
              applyFilter()
    }

    func applyFilter() {
        if let brand = selectedBrand {
            filteredCars = allCars.filter { $0.brand == brand }
        } else {
            filteredCars = allCars
        }
    }

    func clearFilter() {
        selectedBrand = nil
        applyFilter()
    }
}
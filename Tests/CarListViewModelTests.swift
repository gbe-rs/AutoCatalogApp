import XCTest
@testable import AutoCatalogApp

final class CarListViewModelTests: XCTestCase {
    var viewModel: CarListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CarListViewModel()

        //Carros simulados para teste
        viewModel.allCars =  [
            Car(id:1, brand:"Toyota", model: "Corolla"), 
            Car(id:2, brand:"Honda", model: "Civic"), 
            Car(id:3, brand:"Volkswagen", model: "Golf GTI"), 
            Car(id:4, brand:"Chevrolet", model: "Cruze LTZ"), 
            Car(id:5, brand:"Hiunday", model: "Sonata"),
            Car(id:6, brand:"Audi", model: "A4"), 
        ]
    }

    // Carregamento inicial aplica filtro corretamente
     func testInitialFilterIsApplied() {
        viewModel.applyFilter()
        XCTAssertEqual(viewModel.filteredCars.count, 4)
    }

    // Filtro por Marca
    func testFilterByBrand() {
        viewModel.selectedBrand = "Toyota"
        viewModel.applyFilter()
        XCTAssertEqual(viewModel.filteredCars.count, 2)
    }

    // Filtro por texto
    func testFilterBySearchText() {
        viewModel.applyFilter(searchText: "civ")
        XCTAssertEqual(viewModel.filteredCars.first?.model, "Civic")
    }

    // Filtro combinado
    func testCombinedFilter() {
        viewModel.selectedBrand = "Toyota"
        viewModel.applyFilter(searchText: "ya")
        XCTAssertEqual(viewModel.filteredCars.first?.model, "Yaris")
    }

    // Limpeza do filtro
    func testClearFilter() {
        viewModel.selectedBrand = "Toyota"
        viewModel.clearFilter()
        XCTAssertNil(viewModel.selectedBrand)
        XCTAssertEqual(viewModel.filteredCars.count, 4)
    }
}
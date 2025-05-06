import XCTest
@testable import AutoCatalogApp

final class CarListViewModelTests: XCTestCase {
    var viewModel: CarListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CarListViewModel()

        //Carros simulados para teste
        viewModel.allCars =  [
            Car(id:1, brand:"Toyota", model: "Corolla", year: 2022, price: 145000, imageURL: "https://revistacarro.com.br/wp-content/uploads/2019/12/Toyota-Corolla-XEi_4.jpg"),
            Car(id:2, brand:"Honda", model: "Civic", year: 2021, price: 112000, imageURL: "https://cdn.motor1.com/images/mgl/mBrOo/s1/honda-civic-exl-2020.webp"),
            Car(id:3, brand:"Volkswagen", model: "Golf GTI", year: 2025, price: 400000, imageURL: "https://miamiimports.com.br/wp-content/uploads/2024/05/VW-GOLF-GTI-2025-DIANTEIRA-ESQUERDA.png"),
            Car(id:4, brand:"Chevrolet", model: "Cruze LTZ", year: 2019, price: 94000, imageURL: "https://www.autossegredos.com.br/wp-content/uploads/2018/10/cruze-2019.jpg"),
            Car(id:5, brand:"Hiunday", model: "Sonata", year: 2018, price: 78000, imageURL: "https://media.ed.edmunds-media.com/hyundai/sonata/2018/oem/2018_hyundai_sonata_sedan_limited-20t_fq_oem_3_1280x855.jpg"),
            Car(id:6, brand:"Audi", model: "A4", year: 2017, price: 111000, imageURL: "https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/images/15q2/657945/2017-audi-a4-official-photos-and-info-news-car-and-driver-photo-659636-s-original.jpg?resize=1200:*"),
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
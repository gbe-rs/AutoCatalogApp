import Foundation

struct Car: Identifiable, Codable, Equatable {
    let id: Int
    let brand: String
    let model: String
    let year: Int
    let price: Double
    let imageURL: String
}
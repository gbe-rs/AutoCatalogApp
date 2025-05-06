import SwiftUI

struct CarRowView: View {
    let car: Car

    var body: some View {
        HStack{
            AsyncImage(url: URL(string: car.imageURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 60)
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text("\(car.brand) \(car.model)")
                .font(.headline)
                Text("Ano: \(String(car.year))")
                .font(.subheadline)
                Text("R$ \(car.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.green)
            }
        }
    }
}
import SwiftUI

struct CheckStockView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchText: String = ""

    let allParts: [SparePart] = [
        SparePart(name: "Hydraulic Pump", partNumber: "HP-443", stock: 5, location: "Rack A1"),
        SparePart(name: "Drive Belt", partNumber: "DB-001", stock: 12, location: "Shelf C3"),
        SparePart(name: "Sensor Pack", partNumber: "SP-204", stock: 2, location: "Bin B2")
    ]

    var filteredParts: [SparePart] {
        if searchText.isEmpty { return allParts }
        return allParts.filter {
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.partNumber.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        ZStack {
            Color(red: 0.0235, green: 0.1843, blue: 0.2941).ignoresSafeArea()

            VStack {
                header

                TextField("Search part name or number...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                List(filteredParts) { part in
                    NavigationLink(destination: PartDetailView(part: part)) {
                        VStack(alignment: .leading) {
                            Text(part.name).bold()
                            Text("Part #: \(part.partNumber)")
                                .font(.caption)
                            Text("Stock: \(part.stock)")
                                .font(.caption)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
    }

    private var header: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            Spacer()
            NavigationLink(destination: HomeView()) {
                Image(systemName: "house.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}
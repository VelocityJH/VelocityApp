import SwiftUI

struct CheckStockView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchQuery = ""
    @State private var inventory: [SparePart] = [
        SparePart(id: UUID(), number: "123-ABC", name: "Hydraulic Pump", stock: 4, location: "Zone A", imageName: nil),
        SparePart(id: UUID(), number: "456-DEF", name: "Conveyor Motor", stock: 2, location: "Zone B", imageName: nil),
        SparePart(id: UUID(), number: "789-GHI", name: "Control Panel", stock: 0, location: "Zone C", imageName: nil),
        SparePart(id: UUID(), number: "321-JKL", name: "Gearbox Assembly", stock: 3, location: "Zone D", imageName: nil)
    ]

    var filteredParts: [SparePart] {
        if searchQuery.isEmpty {
            return inventory
        } else {
            return inventory.filter { $0.number.localizedCaseInsensitiveContains(searchQuery) }
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            TopNavBar(
                title: "Check Stock",
                onBack: { dismiss() },
                onHome: { dismiss() }
            )

            TextField("Search by part number", text: $searchQuery)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(filteredParts) { part in
                        NavigationLink(destination: CheckPartView(part: part)) {
                            VStack(alignment: .leading) {
                                Text(part.name).font(.headline)
                                Text("Stock: \(part.stock)")
                                Text("Location: \(part.location)").font(.caption)
                            }
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                            .shadow(radius: 2)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .background(StandardBackgroundView())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
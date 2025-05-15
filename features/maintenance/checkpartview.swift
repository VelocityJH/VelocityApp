// CheckStockView.swift

import SwiftUI

struct SparePart: Identifiable {
    let id = UUID()
    let number: String
    let name: String
    var stock: Int
    let location: String
    let imageName: String? // for future use
}

struct CheckStockView: View {
    @Environment(\.dismiss) var dismiss
    @State private var inventory: [SparePart] = [
        SparePart(number: "123-ABC", name: "Hydraulic Pump", stock: 4, location: "Bay 3", imageName: nil),
        SparePart(number: "456-DEF", name: "Conveyor Motor", stock: 2, location: "Zone A", imageName: nil),
        SparePart(number: "789-GHI", name: "Control Panel", stock: 0, location: "Zone C", imageName: nil),
        SparePart(number: "321-JKL", name: "Gearbox Assembly", stock: 1, location: "Main Store", imageName: nil)
    ]

    var body: some View {
        VStack(spacing: 16) {
            TopNavBar(
                title: "Check Stock",
                onBack: { dismiss() },
                onHome: { dismiss() }
            )

            List(inventory) { part in
                NavigationLink(destination: CheckPartView(part: part)) {
                    VStack(alignment: .leading) {
                        Text(part.name).font(.headline)
                        Text("Stock: \(part.stock)")
                        Text("Location: \(part.location)").font(.caption)
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .background(StandardBackgroundView())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
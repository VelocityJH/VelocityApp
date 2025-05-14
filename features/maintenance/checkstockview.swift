import SwiftUI

struct Part: Identifiable {
    let id = UUID()
    let number: String
    let name: String
    let stock: Int
    let location: String
}

struct CheckStockView: View {
    @State private var partNumber: String = ""
    @State private var foundPart: Part?
    @State private var showNotFound = false

    private let inventory: [Part] = [
        Part(number: "123-ABC", name: "Hydraulic Pump", stock: 4, location: "Zone A"),
        Part(number: "456-DEF", name: "Conveyor Motor", stock: 2, location: "Zone C"),
        Part(number: "789-GHI", name: "Control Panel", stock: 0, location: "Zone D"),
        Part(number: "321-JKL", name: "Gearbox Assembly", stock: 1, location: "Zone B")
    ]

    var body: some View {
        ZStack {
            StandardBackgroundView()

            VStack(spacing: 20) {
                TopNavBar(
                    title: "Check Stock",
                    onBack: {},
                    onHome: {}
                )

                Spacer()

                Button("📷 Take Picture of Part") {
                    // Placeholder for future AI scan
                }
                .buttonStyle(.borderedProminent)

                TextField("Enter Part Number", text: $partNumber)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .foregroundColor(.black)

                Button("🔍 Search") {
                    foundPart = inventory.first { $0.number == partNumber }
                    showNotFound = foundPart == nil
                }
                .buttonStyle(.borderedProminent)

                if let part = foundPart {
                    VStack(spacing: 8) {
                        Text("Name: \(part.name)")
                        Text("Stock: \(part.stock)")
                        Text("Location: \(part.location)")
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                }

                if showNotFound {
                    Text("❌ Part not found in inventory.")
                        .foregroundColor(.red)
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CheckStockView()
}
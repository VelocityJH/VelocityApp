import SwiftUI

struct Part: Identifiable {
    let id = UUID()
    let number: String
    let name: String
    let stock: Int
    let location: String
    let imageName: String? // Optional future support for photo
}

struct CheckStockView: View {
    @State private var partNumber: String = ""
    @State private var foundPart: Part?
    @State private var showNotFound = false
    @State private var showPartDetail = false

    @State private var inventory: [Part] = [
        Part(number: "123-ABC", name: "Hydraulic Pump", stock: 4, location: "Zone A", imageName: nil),
        Part(number: "456-DEF", name: "Conveyor Motor", stock: 2, location: "Zone C", imageName: nil),
        Part(number: "789-GHI", name: "Control Panel", stock: 0, location: "Zone D", imageName: nil),
        Part(number: "321-JKL", name: "Gearbox Assembly", stock: 1, location: "Zone B", imageName: nil)
    ]

    var body: some View {
        ZStack {
            StandardBackgroundView()

            VStack(spacing: 20) {
                TopNavBar(title: "Check Stock", onBack: {}, onHome: {})

                Spacer()

                Button("📷 Take Picture of Part") { }

                TextField("Enter Part Number", text: $partNumber)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .foregroundColor(.black)

                Button("🔍 Search") {
                    if let found = inventory.first(where: { $0.number == partNumber }) {
                        foundPart = found
                        showPartDetail = true
                        showNotFound = false
                    } else {
                        foundPart = nil
                        showNotFound = true
                    }
                }
                .buttonStyle(.borderedProminent)

                if showNotFound {
                    Text("❌ Part not found").foregroundColor(.red)
                }

                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $showPartDetail) {
            if let part = foundPart {
                PartDetailView(part: part, inventory: $inventory)
            }
        }
    }
}

struct PartDetailView: View {
    var part: Part
    @Binding var inventory: [Part]

    var body: some View {
        VStack(spacing: 16) {
            Text("📦 Part Info").font(.title2).bold()

            if let imageName = part.imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 160)
                    .cornerRadius(10)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 160)
                    .foregroundColor(.gray)
            }

            Text("Name: \(part.name)")
            Text("Number: \(part.number)")
            Text("Location: \(part.location)")
            Text("Stock: \(part.stock)")

            Button("🛠 Take Part") {
                if let index = inventory.firstIndex(where: { $0.id == part.id }) {
                    if inventory[index].stock > 0 {
                        inventory[index].stock -= 1
                        print("Message to manager: Part \(part.number) taken. Stock now \(inventory[index].stock)")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)

            Spacer()
        }
        .padding()
        .presentationDetents([.medium])
    }
}

#Preview {
    CheckStockView()
}
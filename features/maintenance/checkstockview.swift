import SwiftUI

struct CheckPartView: View {
    @Environment(\.dismiss) var dismiss
    @State private var partNumber: String = ""
    @State private var showDetail: Bool = false
    @State private var selectedPart: SparePart? = nil

    var body: some View {
        ZStack {
            StandardBackgroundView()

            VStack(spacing: 20) {
                TopNavBar(
                    title: "Check Stock",
                    onBack: { dismiss() },
                    onHome: { dismiss() }
                )

                VStack(spacing: 12) {
                    Button("📸 Take Picture of Part") {
                        // Placeholder for future camera integration
                    }
                    .buttonStyle(.borderedProminent)

                    TextField("Enter Part Number", text: $partNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                        .padding(.horizontal)

                    Button("🔍 Search") {
                        // Simulate finding a part
                        selectedPart = SparePart.example()
                        showDetail = true
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
        .sheet(isPresented: $showDetail) {
            if let part = selectedPart {
                PartDetailSheet(part: part)
            }
        }
    }
}

struct PartDetailSheet: View {
    let part: SparePart

    var body: some View {
        VStack(spacing: 16) {
            Text("🔩 Part Details")
                .font(.title2)
                .bold()

            if let image = part.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
            }

            Text("📦 Name: \(part.name)")
            Text("🔢 Number: \(part.number)")
            Text("📍 Location: \(part.location)")
            Text("📦 Stock: \(part.stock)")

            Spacer()

            Button("📤 Take Part (Coming Soon)") {
                // Placeholder for future stock removal
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .presentationDetents([.medium, .large])
    }
}

struct SparePart {
    let name: String
    let number: String
    let location: String
    let stock: Int
    let image: UIImage?

    static func example() -> SparePart {
        SparePart(name: "Hydraulic Pump", number: "HP-1222", location: "Zone C Shelf 3", stock: 2, image: nil)
    }
}

#Preview {
    CheckPartView()
}
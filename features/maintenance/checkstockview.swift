import SwiftUI

struct CheckStockView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchText: String = ""
    @State private var showingScanner = false
    @State private var scannedPart: SparePart?
    @State private var showPartDetail = false

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
        NavigationStack {
            ZStack {
                Color(red: 0.0235, green: 0.1843, blue: 0.2941).ignoresSafeArea()

                VStack {
                    header

                    TextField("Search part name or number...", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)

                    Button("📷 Scan Part Number") {
                        showingScanner = true
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)

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
                .padding(.bottom)
                .sheet(isPresented: $showingScanner) {
                    QRScannerView { result in
                        if let match = allParts.first(where: { $0.partNumber.lowercased() == result.lowercased() }) {
                            scannedPart = match
                            showPartDetail = true
                        }
                        showingScanner = false
                    }
                }
                .navigationDestination(isPresented: $showPartDetail) {
                    if let part = scannedPart {
                        PartDetailView(part: part)
                    }
                }
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
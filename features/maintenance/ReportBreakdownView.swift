import SwiftUI

struct ReportBreakdownView: View {
    @ObservedObject private var breakdownManager = BreakdownManager.shared
    @Environment(\.dismiss) var dismiss

    @State private var zone: String = ""
    @State private var area: String = ""
    @State private var equipment: String = ""
    @State private var faultText: String = ""
    @State private var manualSummary: String = ""
    @State private var supportRequested: Bool = false
    @State private var selectedImage: UIImage?

    @State private var showingQRScanner = false
    @State private var showingCamera = false
    @State private var navigateToControl = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.0235, green: 0.1843, blue: 0.2941).ignoresSafeArea()

                VStack(spacing: 20) {
                    headerButtons

                    ScrollView {
                        VStack(spacing: 16) {
                            Text("Report Breakdown")
                                .font(.title2)
                                .foregroundColor(.white)

                            Button("📷 Scan QR for Area & Equipment") {
                                showingQRScanner = true
                            }
                            .buttonStyle(.borderedProminent)

                            TextField("Zone", text: $zone)
                                .textFieldStyle(.roundedBorder)

                            TextField("Area", text: $area)
                                .textFieldStyle(.roundedBorder)

                            TextField("Equipment", text: $equipment)
                                .textFieldStyle(.roundedBorder)

                            Button("📸 Capture Fault Image") {
                                showingCamera = true
                            }
                            .buttonStyle(.borderedProminent)

                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 120)
                                    .cornerRadius(8)
                            }

                            TextEditor(text: $faultText)
                                .frame(height: 80)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))

                            TextField("Optional Summary", text: $manualSummary)
                                .textFieldStyle(.roundedBorder)

                            Toggle("Request Support", isOn: $supportRequested)
                                .tint(.red)

                            Button("✅ Submit Breakdown") {
                                let breakdown = Breakdown(
                                    zone: zone,
                                    area: area,
                                    equipment: equipment,
                                    image: selectedImage,
                                    faultText: faultText,
                                    manualSummary: manualSummary,
                                    supportRequested: supportRequested,
                                    startTime: Date(),
                                    endTime: nil,
                                    status: .open,
                                    reporterName: UserManager.shared.username,
                                    joinedEngineers: []
                                )
                                breakdownManager.addBreakdown(breakdown)
                                NotificationManager.shared.send(message: "🛠 Breakdown reported at \(area) - \(equipment)")

                                navigateToControl = true
                            }
                            .buttonStyle(.borderedProminent)

                            NavigationLink(destination: ControlBreakdownView(), isActive: $navigateToControl) {
                                EmptyView()
                            }
                        }
                        .padding(.bottom)
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $showingCamera) {
            ImagePicker(image: $selectedImage)
                .onDisappear {
                    if let image = selectedImage {
                        extractText(from: image) { text in
                            faultText = text
                        }
                    }
                }
        }
        .sheet(isPresented: $showingQRScanner) {
            QRScannerView { scanned in
                let parts = scanned.components(separatedBy: ";")
                if parts.count >= 2 {
                    zone = parts[0]
                    equipment = parts[1]
                }
                showingQRScanner = false
            }
        }
    }

    private var headerButtons: some View {
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
    }

    private func extractText(from image: UIImage, completion: @escaping (String) -> Void) {
        // Plug in OCR (VisionKit or Tesseract later)
        completion("⚠️ Auto-detected fault text placeholder")
    }
}
import SwiftUI
import PhotosUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss

    @State private var selectedImage: UIImage?
    @State private var showScanner = false

    @State private var zone: String = ""
    @State private var equipment: String = ""
    @State private var faultText: String = ""
    @State private var supportRequired: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground").ignoresSafeArea()

                VStack(spacing: 16) {
                    NavigationHeader(
                        title: "Report Breakdown",
                        onBack: { dismiss() },
                        onHome: {} // Add nav to HomeView if needed
                    )

                    ScrollView {
                        VStack(spacing: 16) {

                            // QR Button
                            Button("Scan QR (Zone + Equipment)") {
                                showScanner.toggle()
                            }
                            .buttonStyle(PrimaryButtonStyle(backgroundColor: .blue))

                            // Manual Inputs
                            InputField(placeholder: "Zone", text: $zone)
                            InputField(placeholder: "Equipment", text: $equipment)

                            // Fault Image
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 160)
                                    .cornerRadius(8)
                            }

                            // PhotoPicker
                            PhotoPicker(image: $selectedImage)
                                .onChange(of: selectedImage) { newImage in
                                    if let image = newImage {
                                        OCRManager.extractText(from: image) { text in
                                            DispatchQueue.main.async {
                                                self.faultText = text
                                            }
                                        }
                                    }
                                }

                            InputField(placeholder: "Fault description or auto-extracted code...", text: $faultText)

                            Toggle("Support Required", isOn: $supportRequired)
                                .toggleStyle(.switch)
                                .tint(.blue)
                                .padding(.horizontal)

                            Button("✅ Submit Breakdown") {
                                submitBreakdown()
                            }
                            .buttonStyle(PrimaryButtonStyle(backgroundColor: .green))
                            .padding(.horizontal)
                        }
                        .padding(.top)
                    }
                }
            }
            .sheet(isPresented: $showScanner) {
                QRScannerView { result in
                    let parts = result.components(separatedBy: "-")
                    if parts.count >= 2 {
                        self.zone = parts[0]
                        self.equipment = parts[1]
                    }
                    showScanner = false
                }
            }
        }
    }

    func submitBreakdown() {
        print("Breakdown submitted: Zone=\(zone), Equipment=\(equipment)")
    }
}
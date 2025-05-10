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

    @State private var navigateToControl = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground").ignoresSafeArea()

                VStack(spacing: 16) {
                    NavigationHeader(
                        title: "Report Breakdown",
                        onBack: { dismiss() },
                        onHome: {} // Add if needed
                    )

                    ScrollView {
                        VStack(spacing: 16) {
                            Button("Scan QR (Zone + Equipment)") {
                                showScanner.toggle()
                            }
                            .buttonStyle(PrimaryButtonStyle(backgroundColor: .blue))

                            InputField(placeholder: "Zone", text: $zone)
                            InputField(placeholder: "Equipment", text: $equipment)

                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 150)
                                    .cornerRadius(8)
                            }

                            PhotoPicker(image: $selectedImage)
                                .onChange(of: selectedImage) { newImage in
                                    if let image = newImage {
                                        OCRManager.extractText(from: image) { result in
                                            DispatchQueue.main.async {
                                                self.faultText = result
                                            }
                                        }
                                    }
                                }

                            InputField(placeholder: "Fault Description (Auto or Manual)", text: $faultText)

                            Toggle("Support Required", isOn: $supportRequired)
                                .toggleStyle(SwitchToggleStyle(tint: .blue))
                                .padding(.horizontal)

                            Button("✅ Submit Breakdown") {
                                submitBreakdown()
                                navigateToControl = true
                            }
                            .buttonStyle(PrimaryButtonStyle(backgroundColor: .green))
                            .padding(.horizontal)

                            // Auto-navigation to Control screen
                            NavigationLink(
                                destination: ControlBreakdownView(
                                    zone: zone,
                                    equipment: equipment,
                                    fault: faultText,
                                    supportRequested: supportRequired
                                ),
                                isActive: $navigateToControl
                            ) {
                                EmptyView()
                            }
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
        NotificationManager.shared.send(
            message: """
            🚨 Breakdown Reported
            📍 Zone: \(zone)
            🛠 Equipment: \(equipment)
            📝 Fault: \(faultText)
            🔧 Support: \(supportRequired ? "Yes" : "No")
            """
        )
    }
}
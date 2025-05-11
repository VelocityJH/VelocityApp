import SwiftUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss

    @State private var selectedImage: UIImage?
    @State private var showScanner = false
    @State private var zone = ""
    @State private var equipment = ""
    @State private var faultText = ""
    @State private var supportRequired = false

    var body: some View {
        ZStack {
            StandardBackground()

            VStack(spacing: 16) {
                NavigationHeader(
                    title: "Report Breakdown",
                    onBack: { dismiss() }
                )

                ScrollView {
                    VStack(spacing: 16) {
                        ActionCard(
                            iconName: "qrcode.viewfinder",
                            title: "Scan Area",
                            action: {
                                showScanner = true
                            }
                        )

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
                        InputField(placeholder: "Fault Summary", text: $faultText)

                        Toggle("Support Required", isOn: $supportRequired)
                            .padding(.horizontal)

                        Button("Submit Report") {
                            // hook up with NotificationManager + nav
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                }
            }
        }
        .fullScreenCover(isPresented: $showScanner) {
            QRScannerView { result in
                if let code = result {
                    zone = code
                }
                showScanner = false
            }
        }
    }
}
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
        ZStack {
            StandardBackground()

            VStack(spacing: 16) {
                NavigationHeader(
                    title: "Report Breakdown",
                    onBack: { dismiss() }
                )

                ScrollView {
                    VStack(spacing: 16) {

                        Button {
                            showScanner = true
                        } label: {
                            ActionCard(
                                iconName: "qrcode.viewfinder",
                                title: "Scan Area"
                            )
                        }

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
                            // hook up with NotificationManager & nav later
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                }
            }
        }
    }
}
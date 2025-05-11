import SwiftUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss

    @State private var zone: String = ""
    @State private var equipment: String = ""
    @State private var faultText: String = ""
    @State private var supportRequired: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TopNavBar(
                    title: "Report Breakdown",
                    onBack: { dismiss() },
                    onHome: { dismiss() }
                )

                ActionCard(
                    iconName: "qrcode.viewfinder",
                    title: "Scan Area",
                    action: { /* Placeholder for QR logic */ }
                )

                ActionCard(
                    iconName: "camera.viewfinder",
                    title: "Upload Image",
                    action: { /* Placeholder for OCR logic */ }
                )

                InputField(placeholder: "Zone", text: $zone)
                InputField(placeholder: "Equipment", text: $equipment)
                InputField(placeholder: "Fault Summary", text: $faultText)

                Toggle("Support Required", isOn: $supportRequired)
                    .padding(.horizontal)

                Button("Submit Report") {
                    // Submission logic stub
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .background(Color("AppBackground").ignoresSafeArea())
    }
}
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

                VStack(spacing: 16) {
                    TextField("Zone", text: $zone)
                        .textFieldStyle(.roundedBorder)

                    TextField("Equipment", text: $equipment)
                        .textFieldStyle(.roundedBorder)

                    TextField("Fault Summary", text: $faultText)
                        .textFieldStyle(.roundedBorder)

                    Toggle("Support Required", isOn: $supportRequired)
                }
                .padding()

                Button("Submit Breakdown") {
                    // Submit stub
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom, 40)
            }
            .padding()
        }
        .background(StandardBackground())
    }
}
import SwiftUI
import PhotosUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss
    @State private var zone: String = ""
    @State private var equipment: String = ""
    @State private var faultSummary: String = ""
    @State private var submittedBy: String = ""
    @ObservedObject var breakdownManager = BreakdownManager.shared

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TopNavBar(
                    title: "Report Breakdown",
                    onBack: { dismiss() },
                    onHome: { dismiss() }
                )

                HStack(spacing: 16) {
                    ActionButton(label: "Scan Area", color: .orange, icon: "qrcode.viewfinder") {
                        // Placeholder for QR
                    }
                    ActionButton(label: "Capture Fault", color: .purple, icon: "camera.fill") {
                        // Placeholder for OCR
                    }
                }

                Group {
                    TextField("Enter Zone/Area", text: $zone)
                    TextField("Enter Equipment", text: $equipment)
                    TextField("Enter Fault Summary", text: $faultSummary)
                    TextField("Your Name", text: $submittedBy)
                }
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.black)
                .padding(.horizontal)

                Button(action: submitBreakdown) {
                    Text("Submit Report")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
        .background(StandardBackgroundView())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

    func submitBreakdown() {
        let newBreakdown = Breakdown(
            zone: zone,
            equipment: equipment,
            faultSummary: faultSummary,
            timeSubmitted: Date(),
            submittedBy: submittedBy,
            status: "Open",
            downtime: 0
        )

        breakdownManager.openBreakdowns.append(newBreakdown)
        dismiss()
    }
}

#Preview {
    ReportBreakdownView()
}
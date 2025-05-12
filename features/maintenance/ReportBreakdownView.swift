import SwiftUI
import PhotosUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss

    @State private var zone = ""
    @State private var equipment = ""
    @State private var faultSummary = ""
    @State private var selectedImage: UIImage?
    @State private var showSuccess = false
    @State private var showError = false

    let submittedBy = "Engineer A"

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.blue)
                }
                Spacer()
                Text("Report Breakdown")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)

            HStack {
                Button("Scan Area") {
                    // Placeholder
                }
                .frame(width: 150, height: 50)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(12)

                Button("Capture Fault") {
                    // Placeholder
                }
                .frame(width: 150, height: 50)
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(12)
            }

            TextField("Enter Zone/Area", text: $zone)
                .textFieldStyle(.roundedBorder)
            TextField("Enter Equipment", text: $equipment)
                .textFieldStyle(.roundedBorder)
            TextField("Enter Fault Summary", text: $faultSummary)
                .textFieldStyle(.roundedBorder)

            Button("Submit Report") {
                handleSubmit()
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
        .background(Color("AppBackground"))
        .alert("Submitted!", isPresented: $showSuccess) {
            Button("OK", role: .cancel) { }
        }
        .alert("Missing fields", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        }
    }

    func handleSubmit() {
        guard !zone.isEmpty, !equipment.isEmpty, !faultSummary.isEmpty else {
            showError = true
            return
        }

        let submittedAt = Date()
        print("Submitted: \(zone), \(equipment), \(faultSummary), by \(submittedBy), at \(submittedAt)")

        showSuccess = true
        zone = ""
        equipment = ""
        faultSummary = ""
    }
}

#Preview {
    ReportBreakdownView()
}
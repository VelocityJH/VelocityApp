import SwiftUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss

    @State private var zone = ""
    @State private var equipment = ""
    @State private var faultSummary = ""
    @State private var showSuccess = false
    @State private var showError = false

    let submittedBy = "Engineer A"

    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    // Top Nav
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        Spacer()
                        Button(action: { dismiss() }) {
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                        }
                    }
                    .padding(.horizontal)
                    .foregroundColor(.blue)

                    Text("Report Breakdown")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(.bottom, 10)

                    // Buttons
                    HStack(spacing: 20) {
                        Button("Scan Area") {}
                            .frame(width: 150, height: 50)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)

                        Button("Capture Fault") {}
                            .frame(width: 150, height: 50)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }

                    // Inputs
                    Group {
                        TextField("Enter Zone/Area", text: $zone)
                        TextField("Enter Equipment", text: $equipment)
                        TextField("Enter Fault Summary", text: $faultSummary)
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                    // Submit
                    Button("Submit Report") {
                        handleSubmit()
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
                .padding()
            }
        }
        .alert("Submitted!", isPresented: $showSuccess) {
            Button("OK", role: .cancel) { }
        }
        .alert("Please fill all fields", isPresented: $showError) {
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

        // Clear inputs
        zone = ""
        equipment = ""
        faultSummary = ""
    }
}

#Preview {
    ReportBreakdownView()
}
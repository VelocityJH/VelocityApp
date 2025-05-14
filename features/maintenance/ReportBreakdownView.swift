import SwiftUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss

    @State private var zone: String = ""
    @State private var equipment: String = ""
    @State private var faultSummary: String = ""
    @State private var photo: UIImage? = nil

    @State private var navigateToControl = false
    @State private var newBreakdown: Breakdown? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 3/255, green: 46/255, blue: 73/255)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        TopNavBar(title: "Report Breakdown", onBack: { dismiss() }, onHome: { dismiss() })

                        // Placeholder QR & Fault capture buttons
                        HStack(spacing: 12) {
                            Button("Scan Area QR") {
                                // TODO: Implement QR
                            }
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)

                            Button("Capture Fault") {
                                // TODO: Implement OCR
                            }
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }

                        Group {
                            TextField("Zone", text: $zone)
                            TextField("Equipment", text: $equipment)
                            TextField("Fault Summary", text: $faultSummary, axis: .vertical)
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .foregroundColor(.black)

                        Button("Submit Breakdown") {
                            submitBreakdown()
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

                // Navigation trigger
                NavigationLink(destination: {
                    if let breakdown = newBreakdown {
                        BreakdownControlView(breakdown: breakdown)
                    }
                }, isActive: $navigateToControl) {
                    EmptyView()
                }
            }
        }
    }

    private func submitBreakdown() {
        let reporter = UserManager.shared.username
        let breakdown = Breakdown(
            zone: zone,
            equipment: equipment,
            faultSummary: faultSummary,
            timeSubmitted: Date(),
            submittedBy: reporter,
            status: "Open"
        )

        BreakdownManager.shared.addBreakdown(breakdown)
        BreakdownManager.shared.joinJob(breakdown: breakdown)

        newBreakdown = breakdown
        navigateToControl = true
    }
}

#Preview {
    ReportBreakdownView()
}
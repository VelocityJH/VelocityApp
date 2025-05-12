struct Breakdown: Identifiable {
    let id: String
    let zone: String
    let equipment: String
    let submittedBy: String
    let faultSummary: String
    let timeSubmitted: String
    let status: String
    var downtime: Int
}

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss

    @State private var openBreakdowns: [Breakdown] = [
        Breakdown(
            id: UUID().uuidString,
            zone: "Zone A",
            equipment: "Conveyor 1",
            submittedBy: "John Doe",
            faultSummary: "Motor failure",
            timeSubmitted: "12 May 2025, 10:45",
            status: "Open",
            downtime: 12
        )
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopNavBar(
                    title: "Open Breakdowns",
                    onBack: { dismiss() },
                    onHome: { dismiss() } // Replace with proper routing
                )

                ForEach(openBreakdowns) { breakdown in
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Zone: \(breakdown.zone)").font(.headline)
                        Text("Equipment: \(breakdown.equipment)")
                        Text("Submitted by: \(breakdown.submittedBy)")
                        Text("Submitted: \(breakdown.timeSubmitted)")
                        Text("Fault: \(breakdown.faultSummary)")
                        Text("Status: \(breakdown.status)")
                        Text("Downtime: \(breakdown.downtime) mins")

                        NavigationLink("Manage Job", destination: Text("Manage job view"))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.green.opacity(0.15))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
        }
        .background(Color("AppBackground").ignoresSafeArea())
    }
}
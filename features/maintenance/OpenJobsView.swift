// Features/Maintenance/OpenJobsView.swift

import SwiftUI

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss

    @State private var openBreakdowns: [Breakdown] = [
        Breakdown(
            id: UUID(),
            zone: "Zone A",
            equipment: "Conveyor 5",
            faultSummary: "Motor fault",
            timeSubmitted: Date(),
            submittedBy: "James",
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
                    onHome: { dismiss() } // Replace with .popToRoot if routing
                )

                ForEach(openBreakdowns) { breakdown in
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Zone: \(breakdown.zone)")
                            .bold()
                        Text("Equipment: \(breakdown.equipment)")
                        Text("Summary: \(breakdown.faultSummary)")
                        Text("Reported by: \(breakdown.submittedBy)")
                        Text("Status: \(breakdown.status)")
                        Text("Downtime: \(breakdown.downtime) mins")
                        Text("Submitted: \(breakdown.timeSubmitted.formatted(.dateTime.hour().minute()))")
                    }
                    .padding()
                    .background(Color.green.opacity(0.3))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
        }
        .background(Color("AppBackground").ignoresSafeArea())
    }
}

#Preview {
    OpenJobsView()
}
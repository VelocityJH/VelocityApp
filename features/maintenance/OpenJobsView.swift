import SwiftUI

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var breakdownManager = BreakdownManager.shared

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopNavBar(
                    title: "Open Breakdowns",
                    onBack: { dismiss() },
                    onHome: { dismiss() }
                )

                ForEach(breakdownManager.openBreakdowns) { breakdown in
                    VStack(alignment: .leading, spacing: 6) {
                        Text("📍 Zone: \(breakdown.zone)").bold()
                        Text("🛠 Equipment: \(breakdown.equipment)")
                        Text("⚠️ Fault: \(breakdown.faultSummary)")
                        Text("👤 Reported by: \(breakdown.submittedBy)")
                        Text("⏱ Downtime: \(breakdown.downtime) mins")
                        Text("📅 Submitted: \(breakdown.timeSubmitted.formatted(.dateTime.hour().minute()))")
                        Text("🔓 Status: \(breakdown.status)")
                    }
                    .padding()
                    .background(Color.green.opacity(0.3))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
        }
        .background(StandardBackgroundView())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    OpenJobsView()
}
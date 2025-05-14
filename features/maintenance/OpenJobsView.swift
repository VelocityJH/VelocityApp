import SwiftUI

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss

    @State private var openBreakdowns: [Breakdown] = [
        Breakdown(
            zone: "Zone A",
            equipment: "Conveyor 5",
            faultSummary: "Motor fault",
            timeSubmitted: Date(),
            submittedBy: "James",
            status: "Open",
            downtime: 12
        ),
        Breakdown(
            zone: "Zone B",
            equipment: "Pump 2",
            faultSummary: "Leak detected",
            timeSubmitted: Date(),
            submittedBy: "Alex",
            status: "Open",
            downtime: 45
        )
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopNavBar(
                    title: "Open Jobs",
                    onBack: { dismiss() },
                    onHome: { dismiss() }
                )

                ForEach(openBreakdowns) { breakdown in
                    VStack(alignment: .leading, spacing: 6) {
                        Text("📍 Zone: \(breakdown.zone)").bold()
                        Text("🛠 Equipment: \(breakdown.equipment)")
                        Text("⚠️ Summary: \(breakdown.faultSummary)")
                        Text("👤 By: \(breakdown.submittedBy)")
                        Text("⏱ Downtime: \(breakdown.downtime) mins")
                        Text("📅 \(breakdown.timeSubmitted.formatted(.dateTime.hour().minute()))")
                    }
                    .padding()
                    .background(Color.white.opacity(0.15))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
            .padding(.top, 16)
        }
        .background(
            Color("AppBackground")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    OpenJobsView()
}
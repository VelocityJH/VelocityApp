import SwiftUI

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var breakdownManager = BreakdownManager.shared

    @State private var selectedBreakdown: Breakdown?
    @State private var showDetail = false

    var body: some View {
        ZStack {
            StandardBackgroundView()

            ScrollView {
                VStack(spacing: 16) {
                    TopNavBar(
                        title: "Open Breakdowns",
                        onBack: { dismiss() },
                        onHome: { dismiss() }
                    )

                    ForEach(breakdownManager.openBreakdowns) { breakdown in
                        Button(action: {
                            selectedBreakdown = breakdown
                            showDetail = true
                        }) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("📍 Zone: \(breakdown.zone)").bold()
                                Text("🛠 Equipment: \(breakdown.equipment)")
                                Text("⚠️ Status: \(breakdown.status)")
                                Text("⏳ Downtime: \(breakdown.downtime) mins")
                                Text("👤 Submitted: \(breakdown.submittedBy)")
                            }
                            .padding()
                            .background(Color.green.opacity(0.3))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                if let breakdown = selectedBreakdown {
                    BreakdownDetailSheet(breakdown: breakdown)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct BreakdownDetailSheet: View {
    let breakdown: Breakdown
    @State private var navigateToControl = false
    @State private var hasJoined = false

    var body: some View {
        VStack(spacing: 16) {
            Text("🧾 Breakdown Details").font(.title2).bold()

            Text("📍 Zone: \(breakdown.zone)")
            Text("🛠 Equipment: \(breakdown.equipment)")
            Text("📝 Summary: \(breakdown.faultSummary)")
            Text("👤 Reported by: \(breakdown.submittedBy)")
            Text("⏱ Downtime: \(breakdown.downtime) mins")
            Text("📅 Submitted: \(breakdown.timeSubmitted.formatted(.dateTime.hour().minute()))")

            if hasJoined {
                Button("🔁 Resume Job") {
                    navigateToControl = true
                }
                .buttonStyle(.borderedProminent)
            } else {
                Button("➕ Join Job") {
                    let username = UserManager.shared.username
                    BreakdownManager.shared.joinJob(breakdown: breakdown, engineer: username)
                    UserDefaults.standard.set(breakdown.id.uuidString, forKey: "lastJoinedBreakdownId")
                    hasJoined = true
                }
                .buttonStyle(.borderedProminent)
            }

            Button("🔧 Control Breakdown") {
                navigateToControl = true
            }
            .buttonStyle(.bordered)

            NavigationLink(destination: BreakdownControlView(breakdown: breakdown),
                           isActive: $navigateToControl) {
                EmptyView()
            }
        }
        .onAppear {
            let username = UserManager.shared.username
            hasJoined = breakdown.joinedEngineers.contains(username)
        }
        .padding()
        .presentationDetents([.medium, .large])
    }
}

#Preview {
    OpenJobsView()
}
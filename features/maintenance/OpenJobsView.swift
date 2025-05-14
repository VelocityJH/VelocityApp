import SwiftUI

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var breakdownManager = BreakdownManager.shared

    @State private var selectedBreakdown: Breakdown?
    @State private var showDetail = false

    var body: some View {
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
                            Text("⏳ Downtime \(breakdown.downtime) mins")
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
        .background(StandardBackgroundView())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct BreakdownDetailSheet: View {
    let breakdown: Breakdown
    @State private var navigateToControl = false

    var body: some View {
        VStack(spacing: 16) {
            Text("🧾 Breakdown Details").font(.title2).bold()
            
            Text("📍 Zone: \(breakdown.zone)")
            Text("🛠 Equipment: \(breakdown.equipment)")
            Text("📝 Summary: \(breakdown.faultSummary)")
            Text("👤 Reported by: \(breakdown.submittedBy)")
            Text("⏱ Downtime: \(breakdown.downtime) mins")
            Text("📅 Submitted: \(breakdown.timeSubmitted.formatted(.dateTime.hour().minute()))")
            
            Spacer()
            
            if hasJoined {
                Button("🔁 Resume Job") {
                    navigateToControl = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
            } else { }
            
            Button("➕ Join Job") {
                BreakdownManager.shared.joinJob(breakdown: breakdown)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            NavigationLink(
                destination: BreakdownControlView(breakdown: breakdown),
                isActive: $navigateToControl
            ) {
                EmptyView()
            }
        }
        .onAppear {
            hasJoined = breakdown.joinedEngineers.contains(username)
        }
        .padding()
        .presentationDetents([.medium, .large])
    }

            Button("🔧 Control Breakdown") {
                navigateToControl = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .presentationDetents([.medium, .large])
    }
}

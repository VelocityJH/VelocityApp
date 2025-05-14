import SwiftUI

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var breakdownManager = BreakdownManager.shared

    @State private var selectedBreakdown: Breakdown?
    @State private var showDetail = false
    @State private var navigateToControl = false

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
                        navigateToControl = true
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

            Button("➕ Join Job") {
                print("🛠 User joined the job for \(breakdown.equipment)")

                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        
            NavigationLink(destination: BreakdownControlView(breakdown: breakdown),
                       isActive: $navigateToControl) {
            EmptyView()
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

#Preview {
    OpenJobsView()
}

import SwiftUI

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var breakdownManager = BreakdownManager.shared
    @ObservedObject var userManager = UserManager.shared

    var body: some View {
        ZStack {
            StandardBackgroundView()
                .ignoresSafeArea()

            VStack(spacing: 0) {
                TopNavBar(
                    title: "Open Jobs",
                    onBack: { dismiss() },
                    onHome: { dismiss() }
                )

                if breakdownManager.openBreakdowns.isEmpty {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("No open jobs!")
                                .foregroundColor(.white)
                                .padding(.top, 20)
                                .padding(.horizontal)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(breakdownManager.openBreakdowns) { breakdown in
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Zone: \(breakdown.zone)").bold()
                                    Text("Equipment: \(breakdown.equipment)")
                                    Text("Submitted by: \(breakdown.submittedBy)")

                                    HStack {
                                        Text("Downtime: \(breakdown.downtime) mins")
                                        Text(downtimeEmoji(for: breakdown.downtime))
                                    }

                                    // JOIN JOB button
                                    if !breakdown.joinedEngineers.contains(userManager.username) {
                                        Button("Join Job") {
                                            breakdownManager.joinJob(breakdown: breakdown)
                                        }
                                        .buttonStyle(.borderedProminent)
                                    } else {
                                        Text("You have joined this job.")
                                            .font(.caption)
                                            .foregroundColor(.green)
                                    }

                                    // CONTROL BREAKDOWN
                                    if breakdown.joinedEngineers.contains(userManager.username) {
                                        NavigationLink(destination: BreakdownControlView(breakdown: breakdown)) {
                                            Text("Control Breakdown")
                                                .frame(maxWidth: .infinity)
                                        }
                                        .buttonStyle(.bordered)
                                    } else {
                                        Text("Join the job to control")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(cardColor(for: breakdown.downtime))
                                .cornerRadius(12)
                                .shadow(radius: 1)
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top)
                    }
                }
            }
        }
    }

    private func cardColor(for downtime: Int) -> Color {
        switch downtime {
        case 0..<15:
            return Color.green.opacity(0.2)
        case 15..<45:
            return Color.yellow.opacity(0.2)
        default:
            return Color.red.opacity(0.2)
        }
    }

    private func downtimeEmoji(for downtime: Int) -> String {
        switch downtime {
        case 0..<15:
            return "🟢"
        case 15..<45:
            return "🟠"
        default:
            return "🔴"
        }
    }
}
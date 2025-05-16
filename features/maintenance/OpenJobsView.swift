import SwiftUI

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var breakdownManager = BreakdownManager.shared
    @ObservedObject var userManager = UserManager.shared

    var body: some View {
        ZStack {
            StandardBackgroundView().ignoresSafeArea()

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
                                let isOwner = breakdown.submittedBy == userManager.username
                                let isJoined = breakdown.joinedEngineers.contains(userManager.username)

                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Zone: \(breakdown.zone)").bold()
                                    Text("Equipment: \(breakdown.equipment)")
                                    Text("Submitted by: \(breakdown.submittedBy)")
                                    
                                    HStack {
                                        Text("Downtime: \(breakdown.downtime) mins")
                                        Text(downtimeEmoji(for: breakdown.downtime))
                                    }

                                    // Show control/join options
                                    if isOwner || isJoined {
                                        NavigationLink(destination: BreakdownControlView(breakdown: breakdown)) {
                                            Text("Control Job")
                                                .frame(maxWidth: .infinity)
                                                .padding()
                                                .background(Color.blue)
                                                .foregroundColor(.white)
                                                .cornerRadius(8)
                                        }
                                    } else {
                                        Button("Join Job") {
                                            breakdownManager.joinJob(breakdown: breakdown)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.orange)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
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
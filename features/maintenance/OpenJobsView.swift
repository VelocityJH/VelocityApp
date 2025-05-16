import SwiftUI

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var breakdownManager = BreakdownManager.shared

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
                                NavigationLink(destination: BreakdownControlView(breakdown: breakdown)) {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("Zone: \(breakdown.zone)").bold()
                                        Text("Equipment: \(breakdown.equipment)")
                                        Text("Submitted by: \(breakdown.submittedBy)")
                                        Text("Downtime: \(breakdown.downtime) mins")
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(cardColor(for: breakdown.downtime))
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                }
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
            return Color.green.opacity(0.3)
        case 15..<45:
            return Color.yellow.opacity(0.3)
        default:
            return Color.red.opacity(0.3)
        }
    }
}
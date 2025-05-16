import SwiftUI

struct OpenJobsView: View {
    @ObservedObject var breakdownManager = BreakdownManager.shared

    var body: some View {
        StandardBackgroundView {
            VStack(spacing: 0) {
                TopNavBar(title: "Open Jobs")

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
                                .shadow(radius: 1)
                            }
                            .padding(.horizontal)
                        }

                        if breakdownManager.openBreakdowns.isEmpty {
                            Text("No open jobs!")
                                .foregroundColor(.white)
                                .padding(.top, 40)
                        }
                    }
                    .padding(.top)
                }
            }
        }
    }

    func cardColor(for downtime: Int) -> Color {
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
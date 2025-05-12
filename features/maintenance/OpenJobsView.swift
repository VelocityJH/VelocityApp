import SwiftUI

struct OpenJobsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var openBreakdowns: [Breakdown] = [
        Breakdown(id: UUID(), zone: "Zone A", downtime: 10, submittedBy: "John Doe", status: "Open")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopNavBar(
                    title: "Open Breakdowns",
                    onBack: { dismiss() },
                    onHome: { dismiss() } // Replace with router.popToRoot() if routing
                )

                ForEach(openBreakdowns) { breakdown in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Zone: \(breakdown.zone)")
                            .font(.headline)
                        Text("Downtime: \(breakdown.downtime) mins")
                        Text("Reported by: \(breakdown.submittedBy)")
                        Text("Status: \(breakdown.status)")
                        NavigationLink(destination: JobDetailView(breakdown: breakdown)) {
                            Text("Manage Job")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
        }
        .background(Color("AppBackground").ignoresSafeArea())
    }
}

struct Breakdown: Identifiable {
    let id: UUID
    let zone: String
    let downtime: Int
    let submittedBy: String
    let status: String
}

struct OpenJobsView_Previews: PreviewProvider {
    static var previews: some View {
        OpenJobsView()
    }
}
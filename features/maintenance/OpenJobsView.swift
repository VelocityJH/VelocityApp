// Features/OpenJobs/OpenJobsView.swift

import SwiftUI

struct OpenJobsView: View {
    @ObservedObject var breakdownManager = BreakdownManager.shared
    @Environment(\.dismiss) private var dismiss
    @State private var expandedBreakdownID: UUID?

    var body: some View {
        ZStack {
            Color(red: 0.00235, green: 0.1843, blue: 0.2941).ignoresSafeArea()

            VStack {
                header
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(breakdownManager.openBreakdowns.filter { $0.status == .open }) { breakdown in
                            jobCard(breakdown)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }

    private var header: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            Spacer()
            NavigationLink(destination: HomeView()) {
                Image(systemName: "house.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }

    private func jobCard(_ breakdown: Breakdown) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Zone: \(breakdown.zone)")
            Text("Equipment: \(breakdown.equipment)")

            if expandedBreakdownID == breakdown.id {
                Text("Reported by: \(breakdown.reporterName)")
                Text("Time: \(formattedDate(breakdown.startTime))")

                HStack {
                    Button("Join Job") {
                        BreakdownManager.shared.addEngineer(to: breakdown, engineerName: UserManager.shared.username)
                    }
                    .buttonStyle(.borderedProminent)

                    NavigationLink("More Info", destination: BreakdownDetailView(breakdown: breakdown))
                        .buttonStyle(.bordered)
                }
            }

            Button(action: {
                expandedBreakdownID = expandedBreakdownID == breakdown.id ? nil : breakdown.id
            }) {
                Text(expandedBreakdownID == breakdown.id ? "Collapse" : "Expand")
                    .font(.caption)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
// Features/Breakdown/BreakdownDetailView.swift

import SwiftUI

struct BreakdownDetailView: View {
    let breakdown: Breakdown
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color(red: 0.00235, green: 0.1843, blue: 0.2941).ignoresSafeArea()

            VStack(spacing: 16) {
                header
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        Group {
                            Text("Zone: \(breakdown.zone)")
                            Text("Equipment: \(breakdown.equipment)")
                            Text("Reported by: \(breakdown.reporterName)")
                            Text("Start Time: \(formattedDate(breakdown.startTime))")
                        }

                        if let image = breakdown.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                                .cornerRadius(8)
                        }

                        if !breakdown.faultText.isEmpty {
                            Text("Fault OCR: \(breakdown.faultText)")
                        }

                        if !breakdown.manualSummary.isEmpty {
                            Text("Manual Summary: \(breakdown.manualSummary)")
                        }

                        if breakdown.supportRequested {
                            Text("Support Requested: YES")
                        }

                        NavigationLink("Job Guide", destination: ManualsView())
                            .buttonStyle(.borderedProminent)

                        NavigationLink("Request Support", destination: SupportRequestView())
                            .buttonStyle(.bordered)

                        HStack {
                            Button("Leave Job") {
                                BreakdownManager.shared.removeEngineer(from: breakdown, engineerName: UserManager.shared.username)
                                dismiss()
                            }

                            Button("End Job") {
                                BreakdownManager.shared.updateStatus(for: breakdown, to: .closed)
                                dismiss()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.top)
                    }
                    .padding()
                    .foregroundColor(.white)
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

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
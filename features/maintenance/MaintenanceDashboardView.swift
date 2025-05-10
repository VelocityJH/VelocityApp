import SwiftUI

struct MaintenanceDashboardView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.0235, green: 0.1843, blue: 0.2941).ignoresSafeArea()

                VStack(spacing: 20) {
                    headerButtons

                    Text("Maintenance Dashboard")
                        .font(.title2)
                        .foregroundColor(.white)

                    VStack(spacing: 20) {
                        fullWidthButton(title: "Report Breakdown", icon: "wrench.fill", destination: ReportBreakdownView())

                        HStack(spacing: 16) {
                            dashboardButton(title: "Check Stock", icon: "archivebox", destination: SparePartsScannerView())
                            dashboardButton(title: "Fault Trees & Manuals", icon: "book", destination: ManualsView())
                        }

                        HStack(spacing: 16) {
                            dashboardButton(title: "Open Jobs", icon: "list.bullet", destination: OpenJobsView())
                            dashboardButton(title: "Shift Handover", icon: "arrow.triangle.2.circlepath", destination: ShiftHandoverView())
                        }

                        HStack(spacing: 16) {
                            dashboardButton(title: "CWO Creation", icon: "doc.badge.plus", destination: CWOCreationView())
                            dashboardButton(title: "Planned Maintenance", icon: "calendar.badge.clock", destination: PlannedMaintenanceView())
                        }
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }

    private var headerButtons: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(0.7))
                    .clipShape(Circle())
            }

            Spacer()

            NavigationLink(destination: HomeView()) {
                Image(systemName: "house.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(0.7))
                    .clipShape(Circle())
            }
        }
    }

    private func fullWidthButton<T: View>(title: String, icon: String, destination: T) -> some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .cornerRadius(12)
        }
    }

    private func dashboardButton<T: View>(title: String, icon: String, destination: T) -> some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(systemName: icon)
                    .font(.title)
                Text(title)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.white)
            .frame(width: 150, height: 100)
            .background(Color.blue)
            .cornerRadius(12)
        }
    }
}
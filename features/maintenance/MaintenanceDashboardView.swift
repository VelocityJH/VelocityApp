import SwiftUI

struct MaintenanceDashboardView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground").ignoresSafeArea()

                VStack(spacing: 20) {
                    NavigationHeader(
                        title: "Maintenance",
                        onBack: { dismiss() },
                        onHome: {} // Add navigation to HomeView if needed
                    )

                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {

                            SectionCard(title: "Report Breakdown", iconName: "exclamationmark.triangle.fill") {
                                // Navigate to ReportBreakdownView
                            }

                            SectionCard(title: "Check Stock", iconName: "shippingbox.fill") {
                                // Navigate to CheckStockView
                            }

                            SectionCard(title: "Fault Trees & Manuals", iconName: "book.fill") {
                                // Navigate to ManualsView
                            }

                            SectionCard(title: "Open Jobs", iconName: "list.bullet.rectangle") {
                                // Navigate to OpenJobsView
                            }

                            SectionCard(title: "Shift Handover", iconName: "arrow.triangle.2.circlepath") {
                                // Navigate to ShiftHandoverView
                            }

                            SectionCard(title: "CWO Creation", iconName: "plus.square.on.square") {
                                // Navigate to CWOCreationView
                            }

                            SectionCard(title: "Planned Maintenance", iconName: "calendar.badge.clock") {
                                // Navigate to PlannedMaintenanceView
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}
import SwiftUI

struct MaintenanceDashboardView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            StandardBackground()

            VStack(spacing: 20) {
                NavigationHeader(
                    title: "Maintenance",
                    onBack: { dismiss() },
                    onHome: { dismiss() } // Replace with routing logic if needed
                )

                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 200)), count: 2)) {
                        ActionCard(
                            iconName: "doc.text.fill",
                            title: "Report Breakdown",
                            action: { /* Navigate to Report Breakdown */ }
                        )

                        ActionCard(
                            iconName: "cube.box.fill",
                            title: "Check Stock",
                            action: { /* Navigate to Check Stock */ }
                        )

                        ActionCard(
                            iconName: "book.fill",
                            title: "Fault Trees & Manuals",
                            action: { /* Navigate to Manuals */ }
                        )

                        ActionCard(
                            iconName: "list.bullet.rectangle",
                            title: "Open Jobs",
                            action: { /* Navigate to Jobs */ }
                        )

                        ActionCard(
                            iconName: "arrow.2.circlepath.circle.fill",
                            title: "Shift Handover",
                            action: { /* Navigate to Handover */ }
                        )

                        ActionCard(
                            iconName: "calendar.badge.plus",
                            title: "CWO Creation",
                            action: { /* Navigate to CWO */ }
                        )

                        ActionCard(
                            iconName: "doc.badge.gearshape",
                            title: "Planned Maintenance",
                            action: { /* Navigate to PM */ }
                        )
                    }
                    .padding()
                }
            }
        }
    }
}
#Preview {
    MaintenanceDashboardView()
}

import SwiftUI

struct MaintenanceDashboardView: View {
    @Environment(\.dismiss) var dismiss

    let columns = [
        GridItem(.flexible(minimum: 150), spacing: 16),
        GridItem(.flexible(minimum: 150), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopNavBar(
                    title: "Maintenance",
                    onBack: { dismiss() },
                    onHome: { dismiss() } // Replace with router logic
                )

                LazyVGrid(columns: columns, spacing: 16) {
                    NavigationLink(destination: ReportBreakdownView()) {
                        ActionCard(iconName: "doc.text.fill", title: "Report Breakdown")
                    }

                    ActionCard(iconName: "cube.box.fill", title: "Check Stock")
                    ActionCard(iconName: "book.fill", title: "Fault Trees & Manuals")
                    ActionCard(iconName: "list.bullet.rectangle", title: "Open Jobs")
                    ActionCard(iconName: "arrow.2.circlepath.circle.fill", title: "Shift Handover")
                    ActionCard(iconName: "calendar.badge.plus", title: "CWO Creation")
                    ActionCard(iconName: "doc.badge.gearshape", title: "Planned Maintenance")
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
        }
        .background(Color("AppBackground").ignoresSafeArea())
    }
}

#Preview {
    MaintenanceDashboardView()
}
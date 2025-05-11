import SwiftUI

struct MaintenanceDashboardView: View {
    @Environment(\.dismiss) var dismiss

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopNavBar(
                    title: "Maintenance",
                    onBack: { dismiss() },
                    onHome: { dismiss() }
                )

                LazyVGrid(columns: columns, spacing: 16) {
                    NavigationLink(destination: ReportBreakdownView()) {
                        ActionCard(iconName: "doc.text.fill", title: "Report Breakdown")
                    }

                    ActionCard(iconName: "cube.box.fill", title: "Check Stock")
                    ActionCard(iconName: "book.fill", title: "Fault Trees")
                    ActionCard(iconName: "list.bullet.rectangle", title: "Open Jobs")
                    ActionCard(iconName: "arrow.2.circlepath", title: "Shift Handover")
                    ActionCard(iconName: "calendar.badge.plus", title: "CWO Creation")
                    ActionCard(iconName: "wrench.and.screwdriver.fill", title: "Planned Maintenance")
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
            .padding(.top)
        }
        .background(StandardBackground())
    }
}
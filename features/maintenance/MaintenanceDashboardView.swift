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
                    onHome: { dismiss() } // Replace with real root nav
                )

                LazyVGrid(columns: columns, spacing: 16) {
                    ActionCard(iconName: "doc.text.fill", title: "Report Breakdown") {}
                    ActionCard(iconName: "cube.box.fill", title: "Check Stock") {}
                    ActionCard(iconName: "book.fill", title: "Fault Trees & Manuals") {}
                    ActionCard(iconName: "list.bullet.rectangle", title: "Open Jobs") {}
                    ActionCard(iconName: "arrow.2.circlepath.circle.fill", title: "Shift Handover") {}
                    ActionCard(iconName: "calendar.badge.plus", title: "CWO Creation") {}
                    ActionCard(iconName: "doc.badge.gearshape", title: "Planned Maintenance") {}
                }
                .padding(.horizontal, 20)
            }
            .padding(.top, 16)
        }
        .background(Color("AppBackground").ignoresSafeArea())
    }
}
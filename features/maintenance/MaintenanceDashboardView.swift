import SwiftUI

struct MaintenanceDashboardView: View {
    @Environment(\.dismiss) var dismiss

    private let columns = [
        GridItem(.fixed(250), spacing: 16),
        GridItem(.fixed(250), spacing: 16)
    ]

    var body: some View {
        ZStack {
            StandardBackground()

            VStack(spacing: 20) {
                NavigationHeader(
                    title: "Maintenance",
                    onBack: { dismiss() },
                    onHome: { /* implement home navigation */ }
                )

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ActionCard(iconName: "doc.text.fill", title: "Report Breakdown") {}
                        ActionCard(iconName: "cube.box.fill", title: "Check Stock") {}
                        ActionCard(iconName: "book.fill", title: "Fault Trees & Manuals") {}
                        ActionCard(iconName: "list.bullet.rectangle", title: "Open Jobs") {}
                        ActionCard(iconName: "arrow.2.circlepath.circle.fill", title: "Shift Handover") {}
                        ActionCard(iconName: "calendar.badge.plus", title: "CWO Creation") {}
                        ActionCard(iconName: "doc.badge.gearshape", title: "Planned Maintenance") {}
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    MaintenanceDashboardView()
}
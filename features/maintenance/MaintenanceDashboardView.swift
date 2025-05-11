import SwiftUI

struct MaintenanceDashboardView: View {
    @Environment(\.dismiss) var dismiss

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ZStack {
            StandardBackground()

            VStack(spacing: 20) {
                NavigationHeader(
                    title: "Maintenance",
                    onBack: { dismiss() },
                    onHome: { dismiss() } // Replace with actual navigation
                )

                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                        ActionCard(iconName: "doc.text.fill", title: "Report Breakdown") {}
                            .frame(width: 250, height: 250)
                        ActionCard(iconName: "cube.box.fill", title: "Check Stock") {}
                            .frame(width: 250, height: 250)
                        ActionCard(iconName: "book.fill", title: "Fault Trees & Manuals") {}
                            .frame(width: 250, height: 250)
                        ActionCard(iconName: "list.bullet.rectangle", title: "Open Jobs") {}
                            .frame(width: 250, height: 250)
                        ActionCard(iconName: "arrow.2.circlepath.circle.fill", title: "Shift Handover") {}
                            .frame(width: 250, height: 250)
                        ActionCard(iconName: "calendar.badge.plus", title: "CWO Creation") {}
                            .frame(width: 250, height: 250)
                        ActionCard(iconName: "doc.badge.gearshape", title: "Planned Maintenance") {}
                            .frame(width: 250, height: 250)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    MaintenanceDashboardView()
}
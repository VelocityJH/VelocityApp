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
                    onHome: { dismiss() }
                )

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(buttonData, id: \.title) { item in
                            ActionCard(iconName: item.icon, title: item.title, action: item.action)
                                .frame(width: 250, height: 250)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
            }
            .padding(.top, 20)
        }
    }

    // Dummy data model for preview and structure
    private var buttonData: [ActionItem] {
        [
            .init("doc.text.fill", "Report Breakdown"),
            .init("cube.box.fill", "Check Stock"),
            .init("book.fill", "Fault Trees & Manuals"),
            .init("list.bullet.rectangle", "Open Jobs"),
            .init("arrow.2.circlepath.circle.fill", "Shift Handover"),
            .init("calendar.badge.plus", "CWO Creation"),
            .init("doc.badge.gearshape", "Planned Maintenance")
        ]
    }

    struct ActionItem {
        let icon: String
        let title: String
        var action: () -> Void = {}
        init(_ icon: String, _ title: String, action: @escaping () -> Void = {}) {
            self.icon = icon
            self.title = title
            self.action = action
        }
    }
}

#Preview {
    MaintenanceDashboardView()
}
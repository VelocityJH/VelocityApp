import SwiftUI

struct MaintenanceDashboardView: View {
    @Environment(\.dismiss) var dismiss

    let columns = [
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
                    onHome: { dismiss() }
                )

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ActionCard(iconName: "doc.text.fill", title: "Report Breakdown", action: { })
                            .frame(width: 250, height: 250)

                        ActionCard(iconName: "cube.box.fill", title: "Check Stock", action: { })
                            .frame(width: 250, height: 250)

                        ActionCard(iconName: "book.fill", title: "Fault Trees & Manuals", action: { })
                            .frame(width: 250, height: 250)

                        ActionCard(iconName: "list.bullet.rectangle", title: "Open Jobs", action: { })
                            .frame(width: 250, height: 250)

                        ActionCard(iconName: "arrow.2.circlepath.circle.fill", title: "Shift Handover", action: { })
                            .frame(width: 250, height: 250)

                        ActionCard(iconName: "calendar.badge.plus", title: "CWO Creation", action: { })
                            .frame(width: 250, height: 250)

                        ActionCard(iconName: "doc.badge.gearshape", title: "Planned Maintenance", action: { })
                            .frame(width: 250, height: 250)
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
    }
}
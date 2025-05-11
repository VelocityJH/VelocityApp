import SwiftUI

struct MaintenanceDashboardView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            StandardBackground()

            VStack(spacing: 20) {
                NavigationHeader(title: "Maintenance", onBack: { dismiss() })

                ScrollView {
                    VStack(spacing: 16) {
                        ActionCard(iconName: "doc.text.fill", title: "Report Breakdown") {
                            // Navigate to ReportBreakdownView()
                        }
                        ActionCard(iconName: "cube.box.fill", title: "Check Stock") {}
                        ActionCard(iconName: "book.fill", title: "Fault Trees & Manuals") {}
                        ActionCard(iconName: "list.bullet.rectangle", title: "Open Jobs") {}
                        ActionCard(iconName: "arrow.2.circlepath.circle.fill", title: "Shift Handover") {}
                        ActionCard(iconName: "doc.badge.gearshape", title: "Planned Maintenance") {}
                        ActionCard(iconName: "calendar.badge.plus", title: "CWO Creation") {}
                    }
                    .padding()
                }
            }
        }
    }
}
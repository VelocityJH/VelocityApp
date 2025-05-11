import SwiftUI

struct MaintenanceDashboardView: View {
    @Environment(\.dismiss) var dismiss

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopNavBar(title: "Maintenance", onBack: { dismiss() }, onHome: { dismiss() })

                LazyVGrid(columns: columns, spacing: 16) {
                    NavigationLink(destination: ReportBreakdownView()) {
                        ActionCard(iconName: "doc.text.fill", title: "Report Breakdown")
                    }

                    ActionCard(iconName: "cube.box.fill", title: "Check Stock")
                    ActionCard(iconName: "book.fill", title: "Fault Trees")
                    ActionCard(iconName: "list.bullet.rectangle", title: "Open Jobs")
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .background(Color("AppBackground").ignoresSafeArea())
    }
}
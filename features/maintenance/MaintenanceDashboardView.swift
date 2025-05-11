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

            ScrollView {
                VStack(spacing: 20) {
                    TopNavBar(onHome: { dismiss() })

                    Text("Maintenance")
                        .font(.title2)
                        .foregroundColor(.white)

                    LazyVGrid(columns: columns, spacing: 16) {
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
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
                .padding()
            }
        }
    }
}

#Preview {
    MaintenanceDashboardView()
}
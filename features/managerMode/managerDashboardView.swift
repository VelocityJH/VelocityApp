import SwiftUI

struct ManagerDashboardView: View {
    @Environment(\.dismiss) var dismiss

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopNavBar(
                    title: "Manager Mode",
                    onBack: { dismiss() },
                    onHome: { dismiss() }
                )

                LazyVGrid(columns: columns, spacing: 16) {
                    ActionCard(iconName: "wrench.fill", title: "Open Jobs")
                    ActionCard(iconName: "exclamationmark.triangle.fill", title: "Problem Areas")
                    ActionCard(iconName: "arrow.triangle.2.circlepath", title: "Shift Handover")
                    ActionCard(iconName: "doc.plaintext.fill", title: "CWO Options")
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
            .padding(.top)
        }
        .background(StandardBackground())
    }
}
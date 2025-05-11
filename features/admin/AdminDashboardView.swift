import SwiftUI

struct AdminDashboardView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopNavBar(
                    title: "Admin Mode",
                    onBack: { dismiss() },
                    onHome: { dismiss() }
                )

                Text("Admin features coming soon...")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.top, 100)
            }
            .padding()
        }
        .background(StandardBackground())
    }
}
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground")
                    .ignoresSafeArea()

                VStack(spacing: 40) {
                    AppLogo()

                    VStack(spacing: 20) {
                        NavigationLink(destination: MaintenanceDashboardView()) {
                            PrimaryButtonStyle(label: "Maintenance", color: .blue)
                        }

                        NavigationLink(destination: ManagerDashboardView()) {
                            PrimaryButtonStyle(label: "Manager Mode", color: .blue)
                        }

                        NavigationLink(destination: AdminDashboardView()) {
                            PrimaryButtonStyle(label: "Admin", color: .blue)
                        }
                    }

                    Spacer()

                    Button("Log Out") {
                        // logout logic
                    }
                    .foregroundColor(.white.opacity(0.7))
                }
                .padding(.horizontal)
            }
        }
    }
}
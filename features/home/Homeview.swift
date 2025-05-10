import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground").ignoresSafeArea()

                VStack(spacing: 40) {
                    Spacer()

                    // Logo placeholder
                    Image("VelocityLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)

                    VStack(spacing: 20) {
                        NavigationLink(destination: MaintenanceDashboardView()) {
                            PrimaryButton(label: "Maintenance", color: .blue) {}
                        }

                        NavigationLink(destination: ManagerDashboardView()) {
                            PrimaryButton(label: "Manager Mode", color: .blue) {}
                        }

                        NavigationLink(destination: AdminView()) {
                            PrimaryButton(label: "Admin", color: .blue) {}
                        }
                    }
                    .padding(.horizontal)

                    Spacer()

                    Button("Log Out") {
                        // Add logout logic here
                    }
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.bottom)
                }
            }
        }
    }
}
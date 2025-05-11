// Features/Home/HomeView.swift

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                StandardBackground()

                VStack(spacing: 40) {
                    AppLogo()

                    VStack(spacing: 20) {
                        NavigationLink {
                            MaintenanceDashboardView()
                        } label: {
                            PrimaryButtonStyle(label: "Maintenance", color: .blue)
                        }

                        NavigationLink {
                            ManagerDashboardView()
                        } label: {
                            PrimaryButtonStyle(label: "Manager Mode", color: .blue)
                        }

                        NavigationLink {
                            AdminDashboardView()
                        } label: {
                            PrimaryButtonStyle(label: "Admin", color: .blue)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 60)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
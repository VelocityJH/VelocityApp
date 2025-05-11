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
                    .padding(.horizontal)
                }
            }
        }
    }
}
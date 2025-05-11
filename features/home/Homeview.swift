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
                        NavigationLink("Maintenance") {
                            MaintenanceDashboardView()
                        }

                        NavigationLink("Manager Mode") {
                            ManagerDashboardView()
                        }

                        NavigationLink("Admin") {
                            AdminDashboardView()
                        }
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 32)
                }
                .padding(.top, 40)
            }
        }
    }
}
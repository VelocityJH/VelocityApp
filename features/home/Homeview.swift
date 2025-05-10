// Features/Home/HomeView.swift
import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            StandardBackground()

            VStack(spacing: 32) {
                Spacer()
                Image("VelocityLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)

                VStack(spacing: 20) {
                    PrimaryButton(icon: "wrench.and.screwdriver", text: "Maintenance") {
                        // Navigate to MaintenanceDashboard
                    }

                    PrimaryButton(icon: "person.crop.rectangle", text: "Admin") {
                        // Navigate to AdminView
                    }

                    PrimaryButton(icon: "briefcase.fill", text: "Manager Mode") {
                        // Navigate to ManagerDashboard
                    }
                }

                Spacer()
            }
        }
    }
}
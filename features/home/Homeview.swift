import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.0235, green: 0.1843, blue: 0.2941).ignoresSafeArea()

                VStack(spacing: 24) {
                    headerButtons

                    Spacer()

                    VStack(spacing: 20) {
                        homeOption(title: "Maintenance", destination: MaintenanceDashboardView())
                        homeOption(title: "Manager Mode", destination: ManagerDashboardView())
                        homeOption(title: "Admin Mode", destination: AdminDashboardView())
                    }

                    Spacer()

                    Button("🔓 Log Out") {
                        // Add logout logic here
                    }
                    .foregroundColor(.red)
                    .padding(.bottom)
                }
                .padding()
            }
        }
    }

    private var headerButtons: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(0.7))
                    .clipShape(Circle())
            }

            Spacer()

            Image("velocity_logo") // Replace with your logo asset name
                .resizable()
                .scaledToFit()
                .frame(height: 40)

            Spacer()

            NavigationLink(destination: HomeView()) {
                Image(systemName: "house.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(0.7))
                    .clipShape(Circle())
            }
        }
    }

    private func homeOption<T: View>(title: String, destination: T) -> some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(12)
        }
        .padding(.horizontal)
    }
}
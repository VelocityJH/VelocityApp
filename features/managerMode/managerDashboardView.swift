import SwiftUI

struct ManagerDashboardView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.00235, green: 0.1843, blue: 0.2941).ignoresSafeArea()

                VStack(spacing: 20) {
                    header

                    Text("Manager Dashboard")
                        .font(.title2)
                        .foregroundColor(.white)

                    Spacer()

                    VStack(spacing: 16) {
                        dashboardNav("Open Jobs", icon: "list.bullet.rectangle", destination: OpenJobsView())
                        dashboardNav("Problem Areas", icon: "exclamationmark.triangle.fill", destination: ProblemAreasView())
                        dashboardNav("Shift Handover", icon: "arrow.left.arrow.right", destination: ShiftHandoverView())
                        dashboardNav("CWO Options", icon: "doc.text.magnifyingglass", destination: CWOAcceptanceView())
                        dashboardNav("Assign Shifts", icon: "person.crop.circle.badge.clock", destination: AssignShiftsView())
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }

    private var header: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
            }

            Spacer()

            NavigationLink(destination: HomeView()) {
                Image(systemName: "house.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }

    private func dashboardNav<T: View>(_ title: String, icon: String, destination: T) -> some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
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
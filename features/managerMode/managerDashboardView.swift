import SwiftUI

struct ManagerDashboardView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            StandardBackground()

            VStack(spacing: 20) {
                NavigationHeader(title: "Manager Mode", onBack: { dismiss() })

                ScrollView {
                    VStack(spacing: 16) {
                        ActionCard(iconName: "list.bullet.clipboard", title: "Open Jobs") {
                            // Navigate to OpenJobsView()
                        }

                        ActionCard(iconName: "flame.fill", title: "Problem Areas") {
                            // Placeholder or future view
                        }

                        ActionCard(iconName: "arrow.triangle.2.circlepath", title: "Shift Handover") {
                            // Navigate to ShiftHandoverView()
                        }

                        ActionCard(iconName: "doc.plaintext", title: "CWO Options") {
                            // Navigate to CWODashboardView()
                        }

                        ActionCard(iconName: "person.2.badge.gearshape", title: "Assign Shifts") {
                            // Navigate to AssignShiftView()
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
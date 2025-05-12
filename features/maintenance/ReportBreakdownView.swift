import SwiftUI
import PhotosUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss

    @State private var zone: String = ""
    @State private var equipment: String = ""
    @State private var faultSummary: String = ""
    @State private var selectedImage: PhotosPickerItem?
    @State private var navigateToControl = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground").ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 16) {
                        TopNavBar(
                            title: "Report Breakdown",
                            onBack: { dismiss() },
                            onHome: { dismiss() }
                        )

                        HStack(spacing: 16) {
                            Button("Scan Area") {}
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(8)

                            Button("Capture Fault") {}
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)

                        InputField(placeholder: "Enter Zone/Area", text: $zone)
                        InputField(placeholder: "Enter Equipment", text: $equipment)
                        InputField(placeholder: "Enter Fault Summary", text: $faultSummary)

                        Button("Submit Report") {
                            handleSubmit()
                        }
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)

                        NavigationLink("", destination: BreakdownControlView(), isActive: $navigateToControl)
                            .hidden()
                    }
                    .padding()
                }
            }
        }
    }

    func handleSubmit() {
        // Capture timestamp & log submission here
        navigateToControl = true
    }
}

#Preview {
    ReportBreakdownView()
}
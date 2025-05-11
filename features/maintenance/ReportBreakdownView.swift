// Features/ReportBreakdown/ReportBreakdownView.swift

import SwiftUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss

    @State private var zone: String = ""
    @State private var equipment: String = ""
    @State private var faultSummary: String = ""
    @State private var selectedImage: UIImage?

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopNavBar(
                    title: "Report Breakdown",
                    onBack: { dismiss() },
                    onHome: { dismiss() } // Replace with your routing logic
                )

                InputField(placeholder: "Zone", text: $zone)
                InputField(placeholder: "Equipment", text: $equipment)
                InputField(placeholder: "Fault Summary", text: $faultSummary)

                PhotoPicker(image: $selectedImage)

                Button("Submit Report") {
                    // handle submit logic
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)
            }
            .padding()
        }
        .background(Color("AppBackground").ignoresSafeArea())
    }
}

#Preview {
    ReportBreakdownView()
}
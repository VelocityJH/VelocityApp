import SwiftUI
import PhotosUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss

    @State private var zone: String = ""
    @State private var equipment: String = ""
    @State private var faultSummary: String = ""
    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var imageData: Data? = nil

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TopNavBar(
                    title: "Report Breakdown",
                    onBack: { dismiss() },
                    onHome: { dismiss() } // Update when routing logic is ready
                )

                HStack(spacing: 16) {
                    Button("Scan Area") {
                        // Placeholder for QR Scanner
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(12)

                    PhotosPicker(selection: $selectedImage, matching: .images) {
                        HStack {
                            Image(systemName: "camera")
                            Text("Capture Fault")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                }

                Group {
                    InputField(placeholder: "Enter Zone/Area", text: $zone)
                    InputField(placeholder: "Enter Equipment", text: $equipment)
                    InputField(placeholder: "Enter Fault Summary", text: $faultSummary)
                }

                Button("Submit Report") {
                    // TODO: Hook up with submission logic
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
        }
        .background(Color("AppBackground").ignoresSafeArea())
    }
}

#Preview {
    ReportBreakdownView()
}
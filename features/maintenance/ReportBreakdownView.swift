import SwiftUI
import PhotosUI

struct ReportBreakdownView: View {
    @Environment(\.dismiss) var dismiss

    @State private var zone: String = ""
    @State private var equipment: String = ""
    @State private var faultSummary: String = ""
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImageData: Data?

    @State private var showingQRAlert = false
    @State private var showingOCRAlert = false

    var body: some View {
        ZStack {
            StandardBackground()

            VStack(spacing: 16) {
                TopNavBar(onHome: { dismiss() })

                Text("Report Breakdown")
                    .font(.title2)
                    .foregroundColor(.white)

                // Scan QR Button (Placeholder)
                Button("Scan Zone QR") {
                    showingQRAlert = true
                }
                .buttonStyle(.borderedProminent)
                .alert("QR Scanner placeholder active", isPresented: $showingQRAlert) {
                    Button("OK", role: .cancel) { }
                }

                TextField("Zone", text: $zone)
                    .textFieldStyle(.roundedBorder)

                TextField("Equipment", text: $equipment)
                    .textFieldStyle(.roundedBorder)

                // OCR Button (Placeholder)
                Button("Scan Fault Image (OCR)") {
                    showingOCRAlert = true
                }
                .buttonStyle(.borderedProminent)
                .alert("OCR placeholder active", isPresented: $showingOCRAlert) {
                    Button("OK", role: .cancel) { }
                }

                TextField("Fault Summary", text: $faultSummary)
                    .textFieldStyle(.roundedBorder)

                PhotosPicker("Attach Image", selection: $selectedPhoto, matching: .images)
                    .onChange(of: selectedPhoto) { newItem in
                        Task {
                            selectedImageData = try? await newItem?.loadTransferable(type: Data.self)
                        }
                    }

                if let data = selectedImageData, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .cornerRadius(8)
                }

                Button("Submit Breakdown") {
                    submitBreakdown()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
        }
    }

    func submitBreakdown() {
        // Basic MVP submission logic goes here
        print("Breakdown submitted: \(zone), \(equipment), \(faultSummary)")
    }
}

#Preview {
    ReportBreakdownView()
}
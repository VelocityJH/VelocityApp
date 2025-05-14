import SwiftUI

struct CheckStockView: View {
    @State private var partNumber: String = ""

    var body: some View {
        VStack(spacing: 20) {
            TopNavBar(
                title: "Check Stock",
                onBack: { /* handle back */ },
                onHome: { /* handle home */ }
            )

            Spacer()

            Button("📸 Take Picture of Part") {
                // Future camera logic
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal)

            TextField("Enter Part Number", text: $partNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Search") {
                // Search action placeholder
                print("Searching for part: \(partNumber)")
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal)

            Spacer()
        }
        .background(StandardBackgroundView())
        .navigationBarHidden(true)
    }
}

#Preview {
    CheckStockView()
}
import SwiftUI

struct CheckPartView: View {
    @Environment(\.dismiss) var dismiss
    let part: SparePart

    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()

            VStack(spacing: 0) {
                TopNavBar(
                    title: "Part Info",
                    onBack: { dismiss() },
                    onHome: { dismiss() }
                )

                ScrollView {
                    VStack(spacing: 16) {
                        if let imageName = part.imageName {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 160)
                                .foregroundColor(.gray)
                        }

                        Group {
                            Text("🆔 Name: \(part.name)")
                            Text("🔢 Number: \(part.number)")
                            Text("📍 Location: \(part.location)")
                            Text("📦 Stock: \(part.stock)")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

                        Spacer()

                        Button("🛠️ Take Part") {
                            // future logic
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .padding(.top, 20)
                    }
                    .padding(.top)
                }
            }
        }
        .navigationBarHidden(true)
    }
}
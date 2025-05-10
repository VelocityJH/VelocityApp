// Features/Support/SupportRequestView.swift

import SwiftUI

struct SupportRequestView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var supportNote: String = ""

    var body: some View {
        ZStack {
            Color(red: 0.00235, green: 0.1843, blue: 0.2941).ignoresSafeArea()

            VStack(spacing: 20) {
                header

                Text("Support Request")
                    .font(.title2)
                    .foregroundColor(.white)

                TextEditor(text: $supportNote)
                    .frame(height: 150)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)

                Button("Send Request") {
                    NotificationManager.shared.send(message: "🚨 Support needed: \(supportNote)")
                    dismiss()
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
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
}
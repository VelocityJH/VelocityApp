// Features/Manuals/ManualsView.swift

import SwiftUI

struct ManualsView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color(red: 0.00235, green: 0.1843, blue: 0.2941).ignoresSafeArea()

            VStack(spacing: 20) {
                header

                Text("Manuals & Fault Trees")
                    .font(.title2)
                    .foregroundColor(.white)

                Spacer()

                Text("Manual viewer coming soon...")
                    .foregroundColor(.gray)

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
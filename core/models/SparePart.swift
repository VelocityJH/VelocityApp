import Foundation

struct SparePart: Identifiable {
    let id = UUID()
    let name: String
    let partNumber: String
    let stock: Int
    let location: String
}
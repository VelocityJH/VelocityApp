// Models/Breakdown.swift

import Foundation

struct Breakdown: Identifiable {
    let id = UUID()
    let zone: String
    let equipment: String
    let faultSummary: String
    let timeSubmitted: Date
    let submittedBy: String
    let status: String
    var downtime: Int
}

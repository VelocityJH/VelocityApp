// Models/Breakdown.swift

import Foundation

struct Breakdown: Identifiable {
    let id = UUID()
    let zone: String
    let equipment: String
    let faultSummary: String
    let submittedBy: String
    let timeSubmitted: Date
}
import Foundation
import UIKit

enum BreakdownStatus: String, Codable {
    case open
    case inProgress
    case closed
}

struct Breakdown: Identifiable, Codable {
    let id: UUID
    var zone: String
    var area: String
    var equipment: String
    var imageData: Data?
    var faultText: String
    var manualSummary: String
    var supportRequested: Bool
    var startTime: Date
    var endTime: Date?
    var status: BreakdownStatus
    var reporterName: String
    var joinedEngineers: [String]

    init(
        id: UUID = UUID(),
        zone: String,
        area: String,
        equipment: String,
        image: UIImage?,
        faultText: String,
        manualSummary: String,
        supportRequested: Bool,
        startTime: Date,
        endTime: Date? = nil,
        status: BreakdownStatus = .open,
        reporterName: String,
        joinedEngineers: [String] = []
    ) {
        self.id = id
        self.zone = zone
        self.area = area
        self.equipment = equipment
        self.imageData = image?.jpegData(compressionQuality: 0.8)
        self.faultText = faultText
        self.manualSummary = manualSummary
        self.supportRequested = supportRequested
        self.startTime = startTime
        self.endTime = endTime
        self.status = status
        self.reporterName = reporterName
        self.joinedEngineers = joinedEngineers
    }

    var image: UIImage? {
        guard let imageData else { return nil }
        return UIImage(data: imageData)
    }
}
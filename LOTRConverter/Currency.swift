import SwiftUI

enum Currency: Double {
    case goldPiece = 1
    case goldPenny = 0.14
    case silverPiece = 0.42
    case silverPenny = 0.11
    case copperPenny = 0.39
    
    var image: ImageResource {
        switch self {
        case .goldPiece:
            return .goldpiece
        case .goldPenny:
            return .goldpenny
        case .silverPiece:
            return .silverpiece
        case .silverPenny:
            return .silverpenny
        case .copperPenny:
            return .copperpenny
        }
    }
    
    var name: String {
        switch self {
        case .goldPiece:
            return "Gold Piece"
        case .goldPenny:
            return "Gold Penny"
        case .silverPiece:
            return "Silver Piece"
        case .silverPenny:
            return "Silver Penny"
        case .copperPenny:
            return "Copper Penny"
        }
    }
}

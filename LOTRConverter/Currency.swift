import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    var id: Currency { self }
    
    case goldPiece = 1
    case goldPenny = 4
    case silverPiece = 16
    case silverPenny = 64
    case copperPenny = 6400
    case europenny = 2.5
    
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
        case .europenny:
            return .europenny
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
        case .europenny:
            return "Europenny"
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
}

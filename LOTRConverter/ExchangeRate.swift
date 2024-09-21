import SwiftUI

struct ExchangeRate: View {
    // MARK: - Properties
    let leftImage: ImageResource
    let rightImage: ImageResource
    let text: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            // Left Currency Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange Rate Text
            Text(text)
            
            // Right Currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

// MARK: - Preview
#Preview {
    ExchangeRate(leftImage: .goldpiece, rightImage: .goldpenny, text: "1 Silver Piece = 4 Gold Pennies")
}

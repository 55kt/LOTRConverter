import SwiftUI

struct SelectCurrency: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Parchment Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with: ")
                    .fontWeight(.bold)
                
                // Currency Icons
                
                // Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                
                // Currency Icons
                CurrencyIcon(currencyName: "Gold Piece", currencyImage: .goldpiece)
                CurrencyIcon(currencyName: "Gold Penny", currencyImage: .goldpenny)
                CurrencyIcon(currencyName: "Silver Piece", currencyImage: .silverpiece)
                CurrencyIcon(currencyName: "Silver Penny", currencyImage: .silverpenny)
                CurrencyIcon(currencyName: "Copper Penny", currencyImage: .copperpenny)
                
                // Done Button
                DoneButton()
            }
            .padding()
            .multilineTextAlignment(.center)

        }
    }
}

// MARK: - Preview
#Preview {
    SelectCurrency()
}

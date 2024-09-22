import SwiftUI

struct IconGrid: View {
    // MARK: - Properties
    @State var selectedCurrency: Currency
    
    // MARK: - Body
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if selectedCurrency == currency {
                    CurrencyIcon(currencyName: currency.name, currencyImage: currency.image)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 2).opacity(0.5)
                        }
                } else {
                    CurrencyIcon(currencyName: currency.name, currencyImage: currency.image)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    IconGrid(selectedCurrency: .goldPiece)
}

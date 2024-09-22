import SwiftUI

struct SelectCurrency: View {
    // MARK: - Properties
    @State var selectedCurrency: Currency
    
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
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(Currency.allCases) { currency in
                        CurrencyIcon(currencyName: currency.name, currencyImage: currency.image)

                    }
                }
                
                // Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                
                // Currency Icons
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
    SelectCurrency(selectedCurrency: .goldPiece)
}

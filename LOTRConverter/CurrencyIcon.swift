import SwiftUI

struct CurrencyIcon: View {
    // MARK: - Properties
    let currencyName: String
    let currencyImage: ImageResource
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

// MARK: - Preview
#Preview {
    CurrencyIcon(currencyName: "Copper Penny", currencyImage: .copperpenny)
}

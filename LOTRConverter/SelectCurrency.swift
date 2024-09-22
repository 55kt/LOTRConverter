import SwiftUI

struct SelectCurrency: View {
    // MARK: - Properties
    @State var topCurrency: Currency = .goldPiece
    @State var bottomCurrency: Currency = .copperPenny
    
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
                IconGrid(selectedCurrency: topCurrency)
                
                // Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                
                // Currency Icons
                IconGrid(selectedCurrency: bottomCurrency)

                
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

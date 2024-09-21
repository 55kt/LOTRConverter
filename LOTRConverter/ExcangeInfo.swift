import SwiftUI

struct ExcangeInfo: View {
    var body: some View {
        ZStack {
            // Background Parchment Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Title Text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                // Description Text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                // Exchange Rates
                ExchangeRate(leftImage: .goldpiece, rightImage: .goldpenny, text: "1 Gold Piece = 4 Gold Pennies")
                
                ExchangeRate(leftImage: .goldpenny, rightImage: .silverpiece, text: "1 Gold Penny = 25 Silver Pennies")
                
                ExchangeRate(leftImage: .silverpiece, rightImage: .silverpenny, text: "1 Silver Piece = 42 Silver Pennies")
                
                ExchangeRate(leftImage: .silverpenny, rightImage: .copperpenny, text: "1 Silver Penny = 100 Cooper Pennies")
                
                // Done Button
                Button("Done") {
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExcangeInfo()
}

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Prancing Pony Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency Exchange Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Currency Conversion Section
                HStack {
                    // Left Conversion Section
                    VStack {
                        // Currency
                        HStack {
                            // Currency image
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency Text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        // TextField
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right Conversion Section
                    VStack {
                        // Currency
                        HStack {
                            // Currency Text
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency Image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        
                        // TextField
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                // Info Button
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}

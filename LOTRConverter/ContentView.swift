import SwiftUI
import TipKit

struct ContentView: View {
    // MARK: - Properties
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State private var leftEnteredAmount: String = UserDefaults.standard.string(forKey: "leftSavedCurrencyAmount") ?? ""
    
    @State private var rightEnteredAmount: String = UserDefaults.standard.string(forKey: "rightSavedCurrencyAmount") ?? ""
    
    @State var leftCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "leftSavedCurrency")) ?? .silverPiece
    @State var rightCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "rightSavedCurrency")) ?? .goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
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
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        // TextField
                        TextField("Amount", text: $leftEnteredAmount)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
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
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        // TextField
                        TextField("Amount", text: $rightEnteredAmount)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
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
        .onTapGesture {
            self.dismissKeyboard()
        }
        .task {
            try? Tips.configure()
        }
        
        // MARK: - OnChange Area
        .onChange(of: leftEnteredAmount) { oldValue, newValue in
                    if leftTyping {
                        if !newValue.isEmpty, let _ = Double(newValue) {
                            rightEnteredAmount = leftCurrency.convert(leftEnteredAmount, to: rightCurrency)
                            UserDefaults.standard.set(newValue, forKey: "leftSavedCurrencyAmount")
                        }
                    }
                }
                .onChange(of: rightEnteredAmount) { oldValue, newValue in
                    if rightTyping {
                        if !newValue.isEmpty, let _ = Double(newValue) {
                            leftEnteredAmount = rightCurrency.convert(rightEnteredAmount, to: leftCurrency)
                            UserDefaults.standard.set(newValue, forKey: "rightSavedCurrencyAmount")
                        }
                    }
                }
                .onChange(of: leftCurrency) { oldValue, newValue in
                    if !rightEnteredAmount.isEmpty, let _ = Double(rightEnteredAmount) {
                        leftEnteredAmount = rightCurrency.convert(rightEnteredAmount, to: leftCurrency)
                        UserDefaults.standard.set(newValue.rawValue, forKey: "leftSavedCurrency")
                    }
                }
                .onChange(of: rightCurrency) { oldValue, newValue in
                    if !leftEnteredAmount.isEmpty, let _ = Double(leftEnteredAmount) {
                        rightEnteredAmount = leftCurrency.convert(leftEnteredAmount, to: rightCurrency)
                        UserDefaults.standard.set(newValue.rawValue, forKey: "rightSavedCurrency")
                    }
                }
        
        // MARK: - Sheets Area
        .sheet(isPresented: $showExchangeInfo) {
            ExcangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}

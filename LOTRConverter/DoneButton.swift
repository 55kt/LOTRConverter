import SwiftUI

struct DoneButton: View {
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body
    var body: some View {
        Button("Done") {
            dismiss()
        }
        .buttonStyle(.borderedProminent)
        .tint(.brown)
        .font(.largeTitle)
        .padding()
        .foregroundStyle(.white)
    }
}

// MARK: - Preview
#Preview {
    DoneButton()
}

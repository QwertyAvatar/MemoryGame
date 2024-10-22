import SwiftUI

struct CardView: View {
    @State var isCovered = true // Zmienna, która będzie kontrolować, czy karta jest zakryta
    var icon: String // Ikona dla karty
    var cardColor: Color = .blue

    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(Color.blue, lineWidth: 2)
                    .fill(isCovered ? Color.blue : Color.white) // Zmienia tło karty na białe po tapnięciu
                    .frame(height: 100) // Ustalamy wysokość dla lepszego wyglądu
                Text(isCovered ? "?" : icon) // Jeśli karta jest zakryta, pokazuje "?", inaczej pokazuje ikonę
                    .font(.largeTitle)
            }
        }
        .opacity(isCovered ? 1 : 0.5)
        .onTapGesture {
            isCovered.toggle() // Po tapnięciu zmieniamy stan karty (zakryta/odkryta)
        }
        .padding()
        .animation(.default, value: isCovered) // Dodajemy animację przy zmianie
    }
}

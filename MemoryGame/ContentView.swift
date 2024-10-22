import SwiftUI

struct ContentView: View {
    // Lista ikon bazowych
    let baseIcons = ["🥷", "🥼", "🙉", "🏀", "🤿", "♌️", "❤️‍🩹", "🦊"]
    var icons: [String] = [] // Przechowujemy ikonki do wyświetlenia

    init() {
        // Losujemy osiem par ikon (16 kart)
        let selectedIcons = Array(baseIcons.shuffled().prefix(8)) // Losuj 8 unikalnych ikon
        icons = selectedIcons + selectedIcons // Tworzymy 16 kart (8 par)
        icons.shuffle() // Mieszamy ikonki, aby były losowo rozmieszczone
        print(icons) // Debugowanie - wyświetli ikony w konsoli
    }
    
    // Definiujemy kolumny dla siatki
    let columns = [
        GridItem(.flexible()), // Elastyczne kolumny
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView { // Dodajemy ScrollView dla obsługi większej ilości elementów
            LazyVGrid(columns: columns, spacing: 20) { // Używamy LazyVGrid
                ForEach(icons, id: \.self) { icon in
                    CardView(icon: icon) // Tworzymy CardView dla każdej ikony
                }
            }
            .padding() // Padding dla całej siatki
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

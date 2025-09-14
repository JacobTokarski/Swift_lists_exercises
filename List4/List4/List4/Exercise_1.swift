import SwiftUI

class CounterModel: ObservableObject {
    @Published var count: Int = 0
    @Published var hasClickedMaroon: Bool = false

    func reset() { // resetowanie licznika i flagi kliknięcia
        count = 0
        hasClickedMaroon = false
    }
}

struct IronView: View {
    @ObservedObject var counter: CounterModel // klasa którą SwiftUI może obserwować i reaguje na zmiany 
    @State private var showMaroon = false

    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {
                    if counter.count == 0 { // jeśli przycisk nie został kliknięty - mamy false na counterze
                        counter.hasClickedMaroon = false
                    }

                    if counter.hasClickedMaroon { // jeśli kliknięliśmy go raz zaczyna się counter , który przenosi nas do ekranu Maroon
                        counter.count += 1
                        showMaroon = true
                    } else {
                        counter.hasClickedMaroon = true
                        counter.count += 1
                        showMaroon = true
                    }
                }) {
                    Text(counter.hasClickedMaroon ? "\(counter.count)" : "Click to go to Maroon View") // strutkura samego przycisku , jego tekst oraz formatowanie
                        .font(.title)
                        .frame(minWidth: 200, minHeight: 50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Iron View") // tytuł nawigacyjny
            .navigationDestination(isPresented: $showMaroon) { // przechodzi do MaroonView razem z Counterem
                MaroonView(counter: counter)
            }
        }
    }
}

struct MaroonView: View { // drugi widok MaroonView
    @ObservedObject var counter: CounterModel
    @State private var navigateToIron = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Counter was tapped \(counter.count)")
                .font(.title2)

            NavigationLink(destination: IronView(counter: counter), isActive: $navigateToIron) {
                Button("Click to go to Iron View") {
                    counter.reset()
                    navigateToIron = true // tworzenie nowej instancji , która "powieli" nowy IronView
                }
                .frame(minWidth: 180, minHeight: 44)
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Maroon View") // tytuł nawigacyjny
    }
}





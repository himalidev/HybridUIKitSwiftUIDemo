
import SwiftUI

struct CounterView: View {
    @ObservedObject var viewModel: CounterViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("SwiftUI Count: \(viewModel.count)")
                .font(.title)
            Button("Add 1 (SwiftUI)") {
                viewModel.increment()
            }
        }
        .padding()
    }
}

import SwiftUI

struct CartTotal: View {
  var value: Double
  var body: some View {
    HStack {
      Text("Total")
        .font(.caption)
      Spacer()
      Text("$" + String(format: "%.2f", value))
    }
  }
}

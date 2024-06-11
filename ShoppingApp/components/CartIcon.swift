import SwiftUI

struct CartIcon: View {
    var count: String
    var body: some View {
        VStack {
            Text(count)
                .font(.caption.bold())
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(Color("purple"))
                        .frame(width: 20, height: 20))
                .padding(.bottom, -16)
                .padding(.trailing, -16)
                .zIndex(1)
            VStack(alignment: .center) {
                Image("cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
            }
            .frame(width: 40, height: 40)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color(.sRGBLinear, white: 1, opacity: 0.05)))
        }
    }
}

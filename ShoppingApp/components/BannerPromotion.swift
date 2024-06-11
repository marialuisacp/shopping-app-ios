import SwiftUI

struct BannerPromotion: View {
    var body: some View {
        Image("banner")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 460)
            .padding([.all, .trailing], 12)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.05), radius: 5, x: 0, y: 0)
    }
}

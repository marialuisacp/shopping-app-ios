import SwiftUI

struct BannerPromotion: View {
    var body: some View {
        Image("banner2")
            .resizable()
            .cornerRadius(8)
            .aspectRatio(contentMode: .fill)
            .padding([.all, .trailing], 12)
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 460)
    }
}

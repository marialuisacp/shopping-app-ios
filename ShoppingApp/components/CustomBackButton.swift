import SwiftUI

struct CustomBackButton: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  var body: some View { Button(action: {
    self.presentationMode.wrappedValue.dismiss()
  }) {
    Image("backFeatured")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 24, height: 24)
  }
  }
}

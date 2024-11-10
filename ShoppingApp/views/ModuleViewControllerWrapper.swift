import SwiftUI

struct ModuleViewControllerWrapper: UIViewControllerRepresentable {
  typealias UIViewControllerType = ModuleViewController

  func makeUIViewController(context _: UIViewControllerRepresentableContext<ModuleViewControllerWrapper>) -> ModuleViewControllerWrapper.UIViewControllerType {
    let mainStoryboard = UIStoryboard(name: "Module", bundle: nil)
    let mainViewController: ModuleViewController = mainStoryboard.instantiateViewController(withIdentifier: "ModuleID") as! ModuleViewController
    return mainViewController
  }

  func updateUIViewController(_: ModuleViewControllerWrapper.UIViewControllerType, context _: UIViewControllerRepresentableContext<ModuleViewControllerWrapper>) {}
}

import SwiftUI

struct ModuleViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = ModuleViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ModuleViewControllerWrapper>) -> ModuleViewControllerWrapper.UIViewControllerType {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Module", bundle: nil)
        let mainViewController: ModuleViewController = mainStoryboard.instantiateViewController(withIdentifier: "ModuleID") as! ModuleViewController
        return mainViewController
    }

    func updateUIViewController(_ uiViewController: ModuleViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ModuleViewControllerWrapper>) {
        
    }
}

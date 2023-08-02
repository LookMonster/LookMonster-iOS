import RIBs
import VendorProfileUserInterface

protocol VendorProfileHomeInteractable: Interactable {
  var router: VendorProfileHomeRouting? { get set }
  var listener: VendorProfileHomeListener? { get set }
}

protocol VendorProfileHomeViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class VendorProfileHomeRouter: ViewableRouter<VendorProfileHomeInteractable, VendorProfileHomeViewControllable>, VendorProfileHomeRouting {
  
  // TODO: Constructor inject child builder protocols to allow building children.
  override init(interactor: VendorProfileHomeInteractable, viewController: VendorProfileHomeViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}

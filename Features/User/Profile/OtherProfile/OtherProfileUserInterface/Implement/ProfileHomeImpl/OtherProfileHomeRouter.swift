import RIBs
import OtherProfileUserInterface

protocol OtherProfileHomeInteractable: Interactable {
  var router: OtherProfileHomeRouting? { get set }
  var listener: OtherProfileHomeListener? { get set }
}

protocol OtherProfileHomeViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class OtherProfileHomeRouter: ViewableRouter<OtherProfileHomeInteractable, OtherProfileHomeViewControllable>, OtherProfileHomeRouting {
  
  // TODO: Constructor inject child builder protocols to allow building children.
  override init(interactor: OtherProfileHomeInteractable, viewController: OtherProfileHomeViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}

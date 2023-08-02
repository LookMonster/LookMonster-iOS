import RIBs
import UserProfileUserInterface

protocol UserProfileHomeInteractable: Interactable {
  var router: UserProfileHomeRouting? { get set }
  var listener: UserProfileHomeListener? { get set }
}

protocol UserProfileHomeViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class UserProfileHomeRouter: ViewableRouter<UserProfileHomeInteractable, UserProfileHomeViewControllable>, UserProfileHomeRouting {
  
  // TODO: Constructor inject child builder protocols to allow building children.
  override init(interactor: UserProfileHomeInteractable, viewController: UserProfileHomeViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}

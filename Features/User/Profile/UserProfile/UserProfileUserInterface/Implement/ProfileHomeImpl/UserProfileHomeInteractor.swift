import RIBs
import UserProfileUserInterface

protocol UserProfileHomeRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol UserProfileHomePresentable: Presentable {
  var listener: UserProfileHomePresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

final class UserProfileHomeInteractor: PresentableInteractor<UserProfileHomePresentable>, UserProfileHomeInteractable, UserProfileHomePresentableListener {
  
  weak var router: UserProfileHomeRouting?
  weak var listener: UserProfileHomeListener?
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: UserProfileHomePresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    // TODO: Implement business logic here.
  }
  
  override func willResignActive() {
    super.willResignActive()
    // TODO: Pause any business logic.
  }
}

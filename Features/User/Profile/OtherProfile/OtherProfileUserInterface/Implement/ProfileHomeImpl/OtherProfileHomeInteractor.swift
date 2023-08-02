import RIBs
import OtherProfileUserInterface

protocol OtherProfileHomeRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol OtherProfileHomePresentable: Presentable {
  var listener: OtherProfileHomePresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

final class UserProfileHomeInteractor: PresentableInteractor<OtherProfileHomePresentable>, OtherProfileHomeInteractable, OtherProfileHomePresentableListener {
  
  weak var router: OtherProfileHomeRouting?
  weak var listener: OtherProfileHomeListener?
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: OtherProfileHomePresentable) {
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

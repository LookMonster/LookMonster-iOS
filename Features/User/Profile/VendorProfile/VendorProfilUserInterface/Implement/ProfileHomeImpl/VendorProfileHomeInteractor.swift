import RIBs
import VendorProfileUserInterface

protocol VendorProfileHomeRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol VendorProfileHomePresentable: Presentable {
  var listener: VendorProfileHomePresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

final class VendorProfileHomeInteractor: PresentableInteractor<VendorProfileHomePresentable>, VendorProfileHomeInteractable, VendorProfileHomePresentableListener {
  
  weak var router: VendorProfileHomeRouting?
  weak var listener: VendorProfileHomeListener?
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: VendorProfileHomePresentable) {
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

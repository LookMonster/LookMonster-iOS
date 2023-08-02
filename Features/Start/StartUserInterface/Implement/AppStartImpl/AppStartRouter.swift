import RIBs
import RIBsUtil
import SuperUI
import TransportUserInterface
import StartUserInterface

protocol AppStartInteractable: Interactable, TransportHomeListener {
  var router: AppStartRouting? { get set }
  var listener: AppStartListener? { get set }
}

protocol AppStartViewControllable: ViewControllable {

}

final class AppStartRouter: ViewableRouter<AppStartInteractable, AppStartViewControllable>, AppStartRouting {
  
  private let transportHomeBuildable: TransportHomeBuildable
  private var transportHomeRouting: Routing?
  private let transitioningDelegate: PushModalPresentationController
  
  init(
    interactor: AppStartInteractable,
    viewController: AppStartViewControllable,
    transportHomeBuildable: TransportHomeBuildable
  ) {
    self.transitioningDelegate = PushModalPresentationController()
    self.transportHomeBuildable = transportHomeBuildable
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  func attachTransportHome() {
    if transportHomeRouting != nil {
      return
    }
    
    let router = transportHomeBuildable.build(withListener: interactor)
    presentWithPushTransition(router.viewControllable, animated: true)
    attachChild(router)
    self.transportHomeRouting = router
  }
  
  func detachTransportHome() {
    guard let router = transportHomeRouting else {
      return
    }
    
    viewController.dismiss(completion: nil)
    self.transportHomeRouting = nil
    detachChild(router)
  }
  
  private func presentWithPushTransition(_ viewControllable: ViewControllable, animated: Bool) {
    viewControllable.uiviewController.modalPresentationStyle = .custom
    viewControllable.uiviewController.transitioningDelegate = transitioningDelegate
    viewController.present(viewControllable, animated: true, completion: nil)
  }
  
}

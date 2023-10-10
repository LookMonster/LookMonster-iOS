import RIBs
import ShopUserInterface

protocol AllInteractable: Interactable {
    var router: AllRouting? { get set}
    var listener: AllListener? { get set}
}

protocol AllViewControllable: ViewControllable {
    
}

final class AllRouter: ViewableRouter<AllInteractable, AllViewControllable>, AllRouting {
    
    override init(interactor: AllInteractable, viewController: AllViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

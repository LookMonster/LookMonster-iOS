import RIBs
import ShopUserInterface

protocol ShopHomeInteractable: Interactable {
    var router: ShopHomeRouting? { get set}
    var listener: ShopHomeListener? { get set}
}

protocol ShopHomeViewControllable: ViewControllable {
    
}

final class ShopHomeRouter: ViewableRouter<ShopHomeInteractable, ShopHomeViewControllable>, ShopHomeRouting {
    
    override init(interactor: ShopHomeInteractable, viewController: ShopHomeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

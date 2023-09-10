import RIBs
import CommunityUserInterface

protocol PopularInteractable: Interactable {
    var router: PopularRouting? { get set}
    var listener: PopularListener? { get set}
}

protocol PopularViewControllable: ViewControllable {
    
}

final class PopularRouter: ViewableRouter<PopularInteractable, PopularViewControllable>, PopularRouting {
    
    override init(interactor: PopularInteractable, viewController: PopularViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

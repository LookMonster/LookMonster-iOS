import RIBs
import HomeUserInterface

protocol RecommandInteractable: Interactable {
    var router: RecommandRouting? { get set}
    var listener: RecommandListener? { get set}
}

protocol RecommandViewControllable: ViewControllable {
    
}

final class RecommandRouter: ViewableRouter<RecommandInteractable, RecommandViewControllable>, RecommandRouting {
    
    override init(interactor: RecommandInteractable, viewController: RecommandViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

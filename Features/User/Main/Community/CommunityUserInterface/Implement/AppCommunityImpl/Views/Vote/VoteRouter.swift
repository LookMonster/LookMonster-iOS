import RIBs
import CommunityUserInterface

protocol VoteInteractable: Interactable {
    var router: VoteRouting? { get set}
    var listener: VoteListener? { get set}
}

protocol VoteViewControllable: ViewControllable {
    
}

final class VoteRouter: ViewableRouter<VoteInteractable, VoteViewControllable>, VoteRouting {
    
    override init(interactor: VoteInteractable, viewController: VoteViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

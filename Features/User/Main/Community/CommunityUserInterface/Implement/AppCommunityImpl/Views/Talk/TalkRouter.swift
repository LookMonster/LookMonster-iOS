import RIBs
import CommunityUserInterface

protocol TalkInteractable: Interactable {
    var router: TalkRouting? { get set}
    var listener: TalkListener? { get set}
}

protocol TalkViewControllable: ViewControllable {
    
}

final class TalkRouter: ViewableRouter<TalkInteractable, TalkViewControllable>, TalkRouting {
    
    override init(interactor: TalkInteractable, viewController: TalkViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

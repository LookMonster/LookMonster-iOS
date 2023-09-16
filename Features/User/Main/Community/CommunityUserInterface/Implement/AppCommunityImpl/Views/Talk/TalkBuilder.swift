import RIBs
import CommunityUserInterface

final class TalkComponent: Component<TalkDependency> {
    
}

public final class TalkBuilder: Builder<TalkDependency>, TalkBuildable {
    
    public override init(dependency: TalkDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: TalkListener, cuttentImageIndex: Int?) -> ViewableRouting {
        let component = Component(dependency: dependency)
        let viewController = TalkViewController()
        let interactor = TalkInteractor(presenter: viewController)
        interactor.listener = listener
        
        return TalkRouter(interactor: interactor, viewController: viewController)
    }
}

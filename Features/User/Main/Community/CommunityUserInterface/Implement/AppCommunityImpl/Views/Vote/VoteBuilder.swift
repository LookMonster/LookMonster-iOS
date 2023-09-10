import RIBs
import CommunityUserInterface

final class VoteComponent: Component<VoteDependency> {
    
}

public final class VoteBuilder: Builder<VoteDependency>, VoteBuildable {
    
    public override init(dependency: VoteDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: VoteListener, cuttentImageIndex: Int?) -> ViewableRouting {
        let component = Component(dependency: dependency)
        let viewController = VoteViewController()
        let interactor = VoteInteractor(presenter: viewController)
        interactor.listener = listener
        
        return VoteRouter(interactor: interactor, viewController: viewController)
    }
}

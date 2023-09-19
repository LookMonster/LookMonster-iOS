import RIBs
import HomeUserInterface

final class RecommandComponent: Component<RecommandDependency> {
    
}

public final class RecommandBuilder: Builder<RecommandDependency>, RecommandBuildable {
    
    public override init(dependency: RecommandDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: RecommandListener, cuttentImageIndex: Int?) -> ViewableRouting {
        let component = Component(dependency: dependency)
        let viewController = RecommandViewController()
        let interactor = RecommandInteractor(presenter: viewController)
        interactor.listener = listener
        
        return RecommandRouter(interactor: interactor, viewController: viewController)
    }
}

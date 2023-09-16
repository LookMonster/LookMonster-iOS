import RIBs
import CommunityUserInterface

final class PopularComponent: Component<PopularDependency> {
    
}

public final class PopularBuilder: Builder<PopularDependency>, PopularBuildable {
    
    public override init(dependency: PopularDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: PopularListener, cuttentImageIndex: Int?) -> ViewableRouting {
        let component = Component(dependency: dependency)
        let viewController = PopularViewController()
        let interactor = Popularnteractor(presenter: viewController)
        interactor.listener = listener
        
        return PopularRouter(interactor: interactor, viewController: viewController)
    }
}

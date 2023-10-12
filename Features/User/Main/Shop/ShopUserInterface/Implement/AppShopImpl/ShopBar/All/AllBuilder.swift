import RIBs
import SuperUI
import ShopUserInterface

final class AllComponent: Component<AllDependency> {
    
}

public final class AllBuilder: Builder<AllDependency>, AllBuildable {
    
    public override init(dependency: AllDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: AllListener) -> ViewableRouting {
        let component = Component(dependency: dependency)
        let viewController = AllViewController(category: MonsterCategory(categoryId: 3, name: "asdf"))
        let interactor = AllInteractor(presenter: viewController)
        interactor.listener = listener
        
        return AllRouter(interactor: interactor, viewController: viewController)
    }
}

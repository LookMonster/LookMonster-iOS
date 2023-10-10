import RIBs
import SuperUI
import ShopUserInterface

final class AllComponent: Component<AllDependency> {
    
}

public final class AllBuilder: Builder<AllDependency>, AllBuildable {
    
    public override init(dependency: AllDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: AllListener, monsterCategory: MonsterCategory?) -> ViewableRouting {
        let component = Component(dependency: dependency)
        let viewController = AllViewController(category: monsterCategory!)
        let interactor = AllInteractor(presenter: viewController)
        interactor.listener = listener
        
        return AllRouter(interactor: interactor, viewController: viewController)
    }
}

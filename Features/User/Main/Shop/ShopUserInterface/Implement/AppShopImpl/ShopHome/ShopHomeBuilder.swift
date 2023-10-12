import RIBs
import ShopUserInterface

final class ShopHomeComponent: Component<ShopHomeDependency> {
    
}

public final class ShopHomeBuilder: Builder<ShopHomeDependency>, ShopHomeBuildable {
    
    public override init(dependency: ShopHomeDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: ShopHomeListener) -> ViewableRouting {
        let component = Component(dependency: dependency)
        let viewController = ShopHomeViewController()
        let interactor = ShopHomeInteractor(presenter: viewController)
        interactor.listener = listener
        
        return ShopHomeRouter(interactor: interactor, viewController: viewController)
    }
}
